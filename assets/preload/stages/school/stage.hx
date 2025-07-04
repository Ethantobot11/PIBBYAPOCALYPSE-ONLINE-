var background;
var wall;
var vignette;
var vignette2;
var light;

// the thingies that yeah they cool totally 102%
var daGloop;
var daGloop2;
var daGloop3;
var daGloop4;
var daGloop5;

//PENNY MY BELOVED - schweizer
var penny;

// SHADERS GRAH!!!!!! - jason 
var pixel;

function onCreate()
{
    background = new flixel.FlxSprite(0, 0);
    background.loadGraphic(retrieveAsset('images/Ilustracion_sin_titulo-1', 'image'));
    background.setGraphicSize(Std.int(background.width * 1.3));
    background.antialiasing = ClientPrefs.globalAntialiasing;
    background.scrollFactor.set(1, 1);
    background.updateHitbox();

    pixel = new flixel.addons.display.FlxRuntimeShader(RuntimeShaders.pixel, null, 100);
    pixel.setFloat('size', 10);

    if (!ClientPrefs.lowQuality)
    {
        daGloop = new flixel.FlxSprite();
        daGloop.x = 50;
        daGloop.y = 110;
        daGloop.scale.set(1.5, 1.5);
        daGloop.frames = retrieveAsset('images/topgoop', 'atlas');
        daGloop.animation.addByPrefix('topey', 'gooey', 24, false);
        if(ClientPrefs.shaders) daGloop.shader = pixel;

        daGloop2 = new flixel.FlxSprite();
        daGloop2.x = 1450;
        daGloop2.y = 110;
        daGloop2.scale.set(1.5, 1.5);
        daGloop2.frames = retrieveAsset('images/secondtopgoop', 'atlas');
        daGloop2.animation.addByPrefix('topey2', 'gooey', 24, false);
        if(ClientPrefs.shaders) daGloop2.shader = pixel;

        daGloop4 = new flixel.FlxSprite();
        daGloop4.x = 910;
        daGloop4.y = 300;
        daGloop4.scale.set(1.7, 1.7);
        daGloop4.frames = retrieveAsset('images/droplet', 'atlas');
        daGloop4.animation.addByPrefix('dropey', 'gooey', 24, false);
        if(ClientPrefs.shaders) daGloop4.shader = pixel;

        daGloop5 = new flixel.FlxSprite();
        daGloop5.x = 715;
        daGloop5.y = 595;
        daGloop5.scale.set(1.7, 1.7);
        daGloop5.frames = retrieveAsset('images/sinkgoop', 'atlas');
        daGloop5.animation.addByPrefix('sinkey', 'gooey', 24, false);
        if(ClientPrefs.shaders) daGloop5.shader = pixel;

        penny = new flixel.FlxSprite();
        penny.x = 800;
        penny.y = 220;
        penny.scale.set(1.3, 1.3);
        penny.frames = retrieveAsset('images/penny', 'atlas');
        penny.animation.addByPrefix('idle', 'idle', 6, true);

        wall = new flixel.FlxSprite(-200, 200);
        wall.loadGraphic(retrieveAsset('images/Ilustracion_sin_titulo-2', 'image'));
        wall.setGraphicSize(Std.int(wall.width * 1.1));
        wall.antialiasing = ClientPrefs.globalAntialiasing;
        wall.scrollFactor.set(1, 1);
        wall.updateHitbox();

        light = new flixel.FlxSprite(-500, 50);
        light.loadGraphic(retrieveAsset('images/light', 'image'));
        light.setGraphicSize(Std.int(light.width * 1));
        light.antialiasing = ClientPrefs.globalAntialiasing;
        light.scrollFactor.set(1, 1);
        light.updateHitbox();

        vignette = new flixel.FlxSprite(0, 0);
        vignette.loadGraphic(retrieveAsset('images/Ilustracion_sin_titulo-3', 'image'));
        vignette.setGraphicSize(Std.int(vignette.width * 1.3));
        vignette.antialiasing = ClientPrefs.globalAntialiasing;
        vignette.scrollFactor.set(1, 1);
        vignette.updateHitbox();

        vignette2 = new flixel.FlxSprite(0, 0);
        vignette2.loadGraphic(retrieveAsset('images/188_sin_titulo11_20230523094718', 'image'));
        vignette2.setGraphicSize(Std.int(vignette2.width * 1.3));
        vignette2.antialiasing = ClientPrefs.globalAntialiasing;
        vignette2.scrollFactor.set(1, 1);
        vignette2.updateHitbox();
    }

    add(background);
    if (!ClientPrefs.lowQuality) foreground.add(wall);
    if (!ClientPrefs.lowQuality) foreground.add(daGloop);
    if (!ClientPrefs.lowQuality) foreground.add(daGloop2);
    if (!ClientPrefs.lowQuality) foreground.add(vignette);
    if (!ClientPrefs.lowQuality) foreground.add(vignette2);
    if (!ClientPrefs.lowQuality) foreground.add(light);

    if (!ClientPrefs.lowQuality) daGloop.alpha = 0.0001;
    if (!ClientPrefs.lowQuality) daGloop2.alpha = 0.0001;

}

function onSongStart()
{
    PlayState.camZooming = true;
}

function onMoveCamera(focus:String)
    {
        if (focus == 'dad')
            PlayState.defaultCamZoom = 1.2;
        else
            PlayState.defaultCamZoom = 0.9;
    }

function onEvent(event:String, value1:String, value2:String)
    {
     if (event == 'Apple Filter')
        {
             if (value1 == 'on') 
            {
                if (!ClientPrefs.lowQuality) wall.alpha = 0.0001;
                if (!ClientPrefs.lowQuality) vignette2.alpha = 0.0001; 
                if (!ClientPrefs.lowQuality) vignette.alpha = 0.0001; 
                if (!ClientPrefs.lowQuality) light.alpha = 0.0001; 
                if (!ClientPrefs.lowQuality) daGloop.alpha = 0.0001;
                if (!ClientPrefs.lowQuality) daGloop2.alpha = 0.0001;
            }
             else if (value1 == 'off')
            {
                if (!ClientPrefs.lowQuality) wall.alpha = 1;
                if (!ClientPrefs.lowQuality) vignette2.alpha = 1;
                if (!ClientPrefs.lowQuality) vignette.alpha = 1;
                if (!ClientPrefs.lowQuality) light.alpha = 1;
                if (!ClientPrefs.lowQuality) daGloop.alpha = 1;
                if (!ClientPrefs.lowQuality) daGloop2.alpha = 1;
            }
        }
    }

function onUpdate()
    {
        if (PlayState.dad.curCharacter == 'gumball')
                {
                    PlayState.dad.x = 250;
                    PlayState.dad.y = 450;
                }
        else
                {
                    PlayState.dad.x = 300;
                    PlayState.dad.y = 550;
                }
    }

function onStepHit(curStep:Int)
    {
        if (curStep == 392)
            {
                if (!ClientPrefs.lowQuality) add(daGloop5);
                if (!ClientPrefs.lowQuality) add(daGloop4);
                if (!ClientPrefs.lowQuality) add(penny);
                if (!ClientPrefs.lowQuality) daGloop.alpha = 1;
                if (!ClientPrefs.lowQuality) daGloop2.alpha = 1;
            }
    }

//thanks for da code
function onBeatHit(curBeat:Int)
    {
        if (curBeat % 1 == 0)
            doGoo();
        if (curBeat % 1 == 0)
            ponny();
    }


function doGoo()
    {
        if (!ClientPrefs.lowQuality) daGloop5.animation.play('sinkey');
        if (!ClientPrefs.lowQuality) daGloop4.animation.play('dropey');
        if (!ClientPrefs.lowQuality) daGloop2.animation.play('topey2');
        if (!ClientPrefs.lowQuality) daGloop.animation.play('topey');
    }

function ponny()
    {
        if (!ClientPrefs.lowQuality) penny.animation.play('idle');
    }