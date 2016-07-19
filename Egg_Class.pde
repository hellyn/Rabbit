class Egg {

  ArrayList<ShellFragment> shellFragments;

  boolean intact = true;

  float ground = 15;

  PVector location;

  Egg() {
    location = new PVector(300, height - ground);

    shellFragments = new ArrayList<ShellFragment>();
    addShellFragments();
  }


  void addShellFragments() {
    ShellFragment whole = new ShellFragment(location.x, location.y, -15);
    ArrayList<ShellFragment> subFragments = whole.subShellFragments();
    for (ShellFragment f: subFragments) {
      if (random(0, 1) < 0.35) {
        shellFragments.add(f);
      } else {
        shellFragments.addAll(f.subShellFragments());
      }
    }
  }

  void display() {
    if (intact) {
      displayTriangle(location, -15);
    }
    else {
      for (ShellFragment f: shellFragments) {
        f.display();
      }
    }
  }


  void shatter() {
    if (intact) {
      //println("hella shattered!");
      intact = false;
    }
  }

  void update() {
    if (!intact) {
      //println("updating fragments", shellFragments.size());
      for (ShellFragment f: shellFragments) {
        f.update();
      }
    }
  }
}

