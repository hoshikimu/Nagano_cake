class SearchController < ApplicationController
  def search
    @model = params["search"]["model"]
    @content = params["search"]["content"]
    @method = params["search"]["method"]
    @records = search_for(@model, @content, @method)
  end

  private
  def search_for(model, content, method)
    if model == "member"
      if method == 'perfect'
        Member.where(name_family: content)
      elsif method == 'forward'
        Member.where('name_family LIKE ?', content+'%')
      elsif method == 'backward'
        Member.where('name_family LIKE ?', '%'+content)
      else
        Member.where('name_family LIKE ?', '%'+content+'%')
      end
    else
      if method == 'perfect'
        Item.where(name: content)
      elsif method == 'forward'
        Item.where('name LIKE ?', content+'%')
      elsif method == 'backward'
        Item.where('name LIKE ?', '%'+content)
      else
        Item.where('name LIKE ?', '%'+content+'%')
      end
    end
  end
end