{ pkgs, ... }: {
   home.pointerCursor = {
     name = "Bibata-Modern-Classic";
     package = pkgs.bibata-cursors;
     size = 22;
     x11.enable = true;
     gtk.enable = true;
   };
}
