# class SearchController < ApplicationController
#   def index
#     @range = params[:range]
#     search = params[:search_method]
#     word = params[:word]

#     if @range = '1'
#       @member = search(search, word, @range)
#     else
#       @item = search(search, word, @range)
#     end
#   end

#   private

#   def search(search, word, range)
#     if range == '1'
#       if search == "forward_match"
#         Member.where("name_family LIKE ?", word+'%')
#       elsif search == "backward_match"
#         Member.where("name_family LIKE ?", '%'+word)
#       elsif search == "perfect_match"
#         Member.where(name_family: word)
#       elsif search == "partial_match"
#         Member.where("name_family LIKE ?", '%'+word+'%')
#       else
#         Member.all
#       end

#     else
#       if search == "forward_match"
#         Item.where("name LIKE?", word+'%')
#       elsif search == "backward_match"
#         Item.where("name LIKE?", '%'+word)
#       elsif search == "perfect_match"
#         Item.where(name: word)
#       elsif search == "partial_match"
#         Item.where("name LIKE?", '%'+word+'%')
#       else
#         Item.all
#       end
#     end
#   end
# end

class SearchController < ApplicationController
  def index
    @model = params["search"]["model"]
    @content = params["search"]["content"]
    @how = params["search"]["how"]
    @datas = search_for(@how, @model, @content)
  end

  private

  def match(model, content)
    if model == '1'
      Member.where(name: content)
    elsif model == '2'
      Item.where(name: content)
    end
  end

  def forward(model, content)
    if model == '1'
      Member.where("name LIKE ?", "#{content}%")
    elsif model == '2'
      Item.where("name LIKE ?", "#{content}%")
    end
  end

  def backward(model, content)
    if model == '1'
      Member.where("name LIKE ?", "%#{content}")
    elsif model == '2'
      Item.where("name LIKE ?", "%#{content}")
    end
  end

  def partical(model, content)
    if model == '1'
      Member.where("name LIKE ?", "%#{content}%")
    elsif model == '2'
      Item.where("name LIKE ?", "%#{content}%")
    end
  end

  def search_for(how, model, content)
    case how
    when 'match'
      match(model, content)
    when 'forward'
      forward(model, content)
    when 'backward'
      backward(model, content)
    when 'partical'
      partical(model, content)
    end
  end
end