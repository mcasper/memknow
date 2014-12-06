class SuccessMessage
  def message
    text.sample.split("\n")
  end

  def text
    ["Go\nHome\nYou're\nDrunk",
     "Stay\nFly,\nDon't\nDie",
     "Shucky\nDucky\nQuacky\nWackey",
     "You\nHave\nStinky\nFeet",
     "Here's a\nfork.\nYou're\ndone."]
  end
end
