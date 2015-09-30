g = Gal.new
i = GalImage.new
fn = File.join(Rails.root, 'spec/support/test.png')
i.src = File.new(fn)

g.gal_images << i
g.save!  
  
o = Obj.new
o.gal = g
o.save!
