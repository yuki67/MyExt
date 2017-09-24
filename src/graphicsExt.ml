include Graphics

let save_screen filename =
  let img = Graphics.get_image 0 0 (Graphics.size_x ()) (Graphics.size_y ())
            |> Graphic_image.image_of
            |> (fun x -> Images.Rgb24 x) in
  Jpeg.save filename [] img
