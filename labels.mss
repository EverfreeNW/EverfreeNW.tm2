
// ROADS //
@us-shield-name: "[ref].replace(';.*', '').replace('^[^\d]*', '')";
#road_label::us_shield[class='motorway'] {
  // Default shields
  shield-file: url("img/shield/motorway_sm_[reflen].png");
  shield-name: [ref];
  shield-face-name: @sans_bd;
  shield-size: 13;
  shield-fill: @darkblue;
  shield-min-padding: 10;
  shield-min-distance: 40;
  shield-text-transform: uppercase;
  [zoom>=11] { shield-min-distance: 50; }
  [zoom>=12] { shield-min-distance: 70; }
  [zoom>=13] { shield-min-distance: 60; }
  [zoom>=14] { shield-min-distance: 80; }
  // 1 & 2 digit US state highways
  [ref =~ '^(AL|AK|AS|AZ|AR|CA|CO|CT|DE|DC|FM|FL|GA|GU|HI|ID|IL|IN|IA|KS|KY|LA|ME|MH|MD|MA|MI|MN|MS|MO|MT|NE|NV|NH|NJ|NM|NY|NC|ND|MT|OH|OK|OR|PW|PA|PR|RI|SC|SD|TN|TX|UT|VT|VI|VA|WA|WV|WI|WY|SR)\ ?\d[\dA-Z]?(;.*|$)'] {
    shield-file: url(img/shield/us_state_2.png);
    shield-name: @us-shield-name;
  }
  // 3 digit US state highways
  [ref =~ '^(AL|AK|AS|AZ|AR|CA|CO|CT|DE|DC|FM|FL|GA|GU|HI|ID|IL|IN|IA|KS|KY|LA|ME|MH|MD|MA|MI|MN|MS|MO|MT|NE|NV|NH|NJ|NM|NY|NC|ND|MT|OH|OK|OR|PW|PA|PR|RI|SC|SD|TN|TX|UT|VT|VI|VA|WA|WV|WI|WY|SR)\ ?\d\d[\dA-Z](;.*|$)'] {
    shield-file: url(img/shield/us_state_3.png);
    shield-name: @us-shield-name;
  }
  // 1 & 2 digit US highways
  [ref =~ '^US\ ?\d[\dA-Z]?(;.*|$)'] {
    shield-file: url(img/shield/us_highway_2.png);
    shield-name: @us-shield-name;
  }
  // 3 digit US highways
  [ref =~ '^US\ ?\d\d[\dA-Z](;.*|$)'] {
    shield-file: url(img/shield/us_highway_2.png);
    shield-name: @us-shield-name;
  }
  // 1 & 2 digit US Interstates
  [ref =~ '^I\ ?\d[\dA-Z]?(;.*|$)'] {
    shield-file: url(img/shield/us_interstate_2.png);
    shield-name: @us-shield-name;
    shield-fill: #fefef1;
  }
  // 3 digit US Interstates
  [ref =~ '^I\ ?\d\d[\dA-Z](;.*|$)'] {
    shield-file: url(img/shield/us_interstate_3.png);
    shield-name: @us-shield-name;
    shield-fill: #fefef1;
  }
}
#road_label['mapnik::geometry_type'=2] {
  [class='motorway'],
  [class='main'][zoom>=12],
  [class='street'][zoom>=15],
  [class='street_limited'][zoom>=16],
  [class='service'][zoom>=17] {
    text-name: [name];
    text-placement: line;
    text-avoid-edges: true;
    text-min-distance: 200;
    text-size: 12;
    text-name: @name;
    text-face-name: @sans;
    text-fill: white;
    text-size: 14;
    text-halo-fill: fadeout(#000,95);
    text-halo-radius: 5;

    [zoom>=15] { text-size: 14; }
    [zoom>=16] { text-size: 16; }
    [zoom>=17] { text-size: 18; }
    [zoom>=18] { text-size: 20; }
    [class='motorway'] {
      [zoom>=13] { text-size: 13; }
      [zoom>=16] { text-size: 20; }
    }
    [class='service'] {
      text-size: 16;
      text-fill: @darkblue;
    }
  }
}


#poi_label[type!='Aerodrome'][type!='Rail Station'][zoom>=8][zoom<=20] {
  // Bring in labels gradually as one zooms in, based on polygon area.
  [zoom<14],
  [zoom>=14][scalerank=1][localrank<=1],
  [zoom>=15][scalerank<=2][localrank<=1],
  [zoom>=16][scalerank<=3][localrank<=1],
  [zoom>=17][localrank<=4],  [zoom>=18][localrank<=16],
  [zoom>=19] {
    text-name: @name;
    text-face-name:@sans_it;
    text-size: 12;
    text-wrap-before: true;
    text-wrap-width: 80;
    [zoom>=13] { text-wrap-width: 100; }
    [zoom>=14] { text-wrap-width: 110; }
    [zoom>=15] { text-wrap-width: 120; }
	[type='Military'],[maki='cemetery'],[maki='college'] {
      text-fill: darken(@orange, 35%);
    }
    [type='Island'],[maki='park'],[maki='zoo'],[maki='golf'] {
      text-fill: darken(@park, 35%);
    }
	text-fill: @red;
	text-halo-fill: @bright;
    text-halo-radius: 2px;
    text-line-spacing: -2;
    [scalerank=1] {
      [zoom>=15] { text-size: 16; }
      [zoom>=16] { text-size: 18; }
    }
    [scalerank=2] {
      [zoom>=16] { text-size: 16; }
      [zoom>=17] { text-size: 18; }
    }
    [scalerank>=3] {
      [zoom>=17] { text-size: 16; }
      [zoom>=19] { text-size: 18; }
    }
  }
}

// Note: != null condition is a workaround for mapnik#1952.
#poi_label[type='Rail Station'][network!=null][scalerank=1][zoom>=14],
#poi_label[type='Rail Station'][network!=null][scalerank=2][zoom>=15],
#poi_label[type='Rail Station'][network!=null][scalerank=3][zoom>=16] {
  marker-file: url("img/rail/[network]-18.svg");
  marker-height: 18;
  marker-allow-overlap: false;
  [zoom>=16] {
    marker-file: url("img/rail/[network]-12.svg");
    marker-height:24;
    text-name: @name;
    text-face-name: @sans_bd;
    text-fill: @darkblue;
    text-halo-fill: @bright;
    text-halo-radius: 2px;
    text-halo-rasterizer: fast;
    text-size: 14;
    text-wrap-width: 80;
    text-line-spacing: -3;
  }
}

// AIRPORT ICONS, LABELS //
#poi_label[type='Aerodrome'][zoom>=10] {
  marker-file: url("img/icon/aerodrome-default-24.svg");
  [maki='airport'] { marker-file: url("img/icon/aerodrome-international-24.svg"); }
  [maki='heliport'] { marker-file: url("img/icon/aerodrome-heliport-24.svg"); }
  marker-fill: @red;
  marker-width: 12;
  text-name: "''";
  text-size: 10;
  text-fill: @red;
  text-halo-fill: @bright;
  text-halo-radius: 2px;
  text-face-name: @sans_it;
  text-line-spacing: -2;
  text-dy: 9;
  [zoom>=11][zoom<=13][class='international'],
  [zoom>=12][zoom<=13][area>=2500000] {
    text-name: [ref];
  }
  [zoom>=14] {
    text-name: @name;
    text-wrap-before: true;
  }
  [zoom>=11][zoom<=13][scalerank=1],
  [zoom>=12][zoom<=13][scalerank=2] {
    text-name: [ref];
  }
  [zoom>=14] {
    text-name: @name;
    text-wrap-before: true;
  }
  [zoom>=11][scalerank=1],
  [zoom>=12][scalerank=2],
  [zoom>=14] {
    text-size: 12;
    text-dy: 13;
    text-wrap-width: 80;
  }
  [zoom>=13][scalerank=1],
  [zoom>=14][scalerank=2],
  [zoom>=15] {
    marker-width: 18;
    text-size: 12;
    text-dy: 16;
    text-wrap-width: 100;
  }
  [zoom>=14][scalerank=1],
  [zoom>=15][scalerank=2],
  [zoom>=16] {
    marker-width: 24;
    text-size: 14;
    text-dy: 20;
    text-wrap-width: 120;
  }
}