namespace :add_apple_to_basket do
  desc "Add apples to baskets"
  task add_apple: :environment do

    job_done = "no"

    count = ENV['COUNT'].to_i
    variety_to_add = ENV['VARIETY']

    Baskets = Basket.all

    Baskets.each do |basket|
    	 if (count <= (basket.capacity - basket.apples.count) &&
          (basket.apples.count == 0 ||
          basket.apples.where(:variety => variety_to_add).exists?))

          available_basket = basket

          count.times do
            Apple.create!(basket_id: available_basket.id, variety: variety_to_add)
          end

          updated_fill_rate = (basket.apples.count.to_f / basket.capacity).round(2)*100

          if basket.update(fill_rate: updated_fill_rate)
            job_done = "success"
            puts "Fill rate update sucesfull"
          else
            puts "update unsucessfull"
          end

          break
       end
	  end
      puts "All baskets are full. We couldn't find the place for #{count} apples" if job_done.include? "no"
  end
end

#to run
#rake add_apple_to_basket:add_apple COUNT=5 VARIETY="Fuji"