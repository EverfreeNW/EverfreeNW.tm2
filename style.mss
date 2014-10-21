// Languages: name (local), name_en, name_fr, name_es, name_de
@name: '[name_en]';
@name: '[name_en]';
@fallback: 'Arial Unicode MS Regular';
@serif: 'DIN Offc Pro Bold', 'Droid Serif Bold', @fallback;
@sans_it: 'Prater Sans Offc Pro Bold', 'Roboto Bold Condensed Italic', @fallback;
@sans_bd: 'Roboto Black', @fallback;
@water2: #8bdcd4;
@park: #b5d378;
@tan: #f1edcd;
@bright: #fefef9;
@darkblue: #000363;
@red: #D75A9E;
//@red: #ff5f51;
@orange: #D75A9E;

// Fonts //
@sans: 'Super Grotesk Offc Pro Regular';
@sans_italic: 'Source Sans Pro Italic';
@sans_bold: 'Prater Sans Offc Pro Bold';

// Common Colors //
@land: #6f9268;
@water: #7cbce3;
@brand: #007848;

Map { background-color: @land; }

// Political boundaries //

#admin[admin_level=2][maritime=0] {
  line-join: round;
  line-color: #bbe;
  line-width: 1.4;
  opacity: 0.8;
  [zoom>=6] { line-width: 2; }
  [zoom>=8] { line-width: 4; }
  [disputed=1] { line-dasharray: 4,4; }
}

// Places //

#country_label[zoom>=3] {
  text-name: @name;
  text-face-name: @sans_bold;
  text-fill: #fff;
  text-size: 12;
  [zoom>=3][scalerank=1],
  [zoom>=4][scalerank=2],
  [zoom>=5][scalerank=3],
  [zoom>=6][scalerank>3] {
    text-size: 18;
  }
  [zoom>=4][scalerank=1],
  [zoom>=5][scalerank=2],
  [zoom>=6][scalerank=3],
  [zoom>=7][scalerank>3] {
    text-size: 36;
  }
}

#country_label_line { line-color: fadeout(#66a,75%); }

#place_label[localrank<=2] {
  [type='city'][zoom<=15] {
    text-name: @name;
    text-face-name: @sans_bold;
    text-fill: @brand;
    text-halo-fill:rgba(255,255,255,0.8);
    text-halo-radius: 4;
    text-size: 18;
    [zoom>=10] { text-size: 36; }
    [zoom>=12] { text-size: 48; }
  }
  [type='town'][zoom<=17] {
    text-name: @name;
    text-face-name: @sans_bold;
    text-fill: @brand;
    text-size: 14;
    text-fill: @brand;
    text-halo-fill: @bright;
    text-halo-radius: 2;
    text-halo-radius: 5;
    [zoom>=10] { text-size: 16; }
    [zoom>=12] { text-size: 20; }
  }
  [type='village'] {
    text-name: @name;
    text-face-name: @sans_bold;
    text-fill: @brand;
    text-size: 14;
    text-fill: @brand;
    text-halo-fill: @bright;
    text-halo-radius: 2;
    text-halo-radius: 5;
    [zoom>=12] { text-size: 14; }
    [zoom>=14] { text-size: 18; }
  }
  [type='hamlet'],
  [type='suburb'],
  [type='neighbourhood'] {
    text-name: @name;
    text-face-name: @sans_bold;
    text-size: 14;
    text-fill: @brand;
    text-halo-fill: @bright;
    text-halo-radius: 2;
    text-halo-radius: 5;

    [zoom>=14] { text-size: 14; }
    [zoom>=16] { text-size: 14; }
  }
}

// Water Features //

#water {
  polygon-fill: @water;
  polygon-gamma: 0.6;
  line-color: #4E6D4F;
  line-width: 2;
}

#water_label {
  [zoom<=15][area>1000],
  [zoom=16][area>1000],
  [zoom=17][area>1000],
  [zoom>=18][area>0]{
    text-name: @name;
    text-size: 14;
    text-line-spacing: -2;
    text-face-name: @sans_italic;
    text-fill: black;
    text-halo-fill: fadeout(@water,85);
    text-halo-radius: 2;
    text-halo-rasterizer: fast;
  }
}

#waterway {
  [type='river'],
  [type='canal'] {
    line-color: @water;
    line-width: 0.5;
    [zoom>=12] { line-width: 1; }
    [zoom>=14] { line-width: 2; }
    [zoom>=16] { line-width: 3; }
  }
  [type='stream'] {
    line-color: @water;
    line-width: 0.5;
    [zoom>=14] { line-width: 1; }
    [zoom>=16] { line-width: 2; }
    [zoom>=18] { line-width: 3; }
  }
}

// Roads & Railways //

#tunnel { opacity: 0.5; }

#road,
#tunnel,
#bridge {
  ['mapnik::geometry_type'=2] {
    line-color: #000;
    line-width: 0.5;
    opacity: 0.2;
    [class='motorway'],
    [class='main'] {
      [zoom>=10] { line-width: 1; }
      [zoom>=12] { line-width: 2; }
      [zoom>=14] { line-width: 3; }
      [zoom>=16] { line-width: 5; }
    }
    [class='street'],
    [class='street_limited'] {
      [zoom>=14] { line-width: 1; }
      [zoom>=16] { line-width: 2; }
    }
    [class='street_limited'] { line-dasharray: 4,1; }
  }
}


//#landcover[class!='crop'][class!='snow']{
#landcover[class='wood']{
  polygon-fill: #f04;
  line-color: #f04 * .8;
  comp-op: multiply;
  opacity: 0.2;
}

#landuse[class!='agriculture']{
  opacity: 0.4;
  [class='park'],[class='wood'],[class='scrub'],
    [class='pitch'],[class='grass'] {
    polygon-fill: #427834;
    line-color: #427834;
  }
  [class='industrial'],[class='parking'],
    [class='school'],[class='hospital'] {
    polygon-fill: #df2;
    line-color: #df2 * .5;
  }
  [class='cemetery'] {
    polygon-fill: #2df;
    line-color: #2df * .8;
  }
  comp-op: multiply;
  [zoom>15] { line-width:2; }
}

#landuse_overlay { polygon-fill: #2df; comp-op:multiply; }
