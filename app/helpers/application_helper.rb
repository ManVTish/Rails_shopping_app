module ApplicationHelper
  include Pagy::Frontend

  def flash_msg_classes(type)
    default_clasess = "flex sticky top-0 flash__message border-l-4 container rounded py-3 mt-1 w-fit"
    default_clasess += " bg-orange-100 border-orange-500 text-orange-700" if type == 'alert'
    default_clasess += " bg-green-100 border border-green-400 text-green-700" if type == 'notice'
    default_clasess
  end
end
