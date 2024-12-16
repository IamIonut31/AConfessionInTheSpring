using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using TMPro;


/*
- Creator:    Two TV Games (@gallighanmaker)
- Script:     Day And Night 2D System
- Unity:      2019 LTS Version
- Email:      leandrovieira92@gmail.com
- Github:     https://github.com/leandrovieiraa
*/

public enum DayCycles // Enum with day and night cycles, you can change or modify with whatever you want
{
    Sunrise = 0,
    Day = 1,
    Sunset = 2,
    Night = 3,
    Midnight = 4
}

public class DayNightSystem2D : MonoBehaviour
{

    [Header("Controllers")]
    
    [Tooltip("Global light 2D component, we need to use this object to place light in all map objects")]
    public UnityEngine.Rendering.Universal.Light2D globalLight; // global light
    
    [Tooltip("Enum with multiple day cycles to change over time, you can add more types and modify whatever you want to fits on your project")]
    public static DayCycles dayCycle = DayCycles.Sunrise; // default cycle

    [Header("Cycle Colors")]
    
    [Tooltip("Sunrise color, you can adjust based on best color for this cycle")]
    public Color sunrise; // Eg: 6:00 at 10:00
    
    [Tooltip("(Mid) Day color, you can adjust based on best color for this cycle")]
    public Color day; // Eg: 10:00 at 16:00
    
    [Tooltip("Sunset color, you can adjust based on best color for this cycle")]
    public Color sunset; // Eg: 16:00 20:00
    
    [Tooltip("Night color, you can adjust based on best color for this cycle")]
    public Color night; // Eg: 20:00 at 00:00
    
    [Tooltip("Midnight color, you can adjust based on best color for this cycle")]
    public Color midnight; // Eg: 00:00 at 06:00

    [Header("Objects")]
    [Tooltip("Objects to turn on and off based on day night cycles, you can use this example for create some custom stuffs")]
    public UnityEngine.Rendering.Universal.Light2D[] mapLights; // enable/disable in day/night states

    [SerializeField] AudioSource Nature;
    [SerializeField] AudioSource NatureNight;
    public TextMeshProUGUI TimeOnScreen;
    private static float seconds = 0;
    private static int minutes = 0;
    private static int hours = 7;
    private static float x = 0;

    void Start() 
    {
        //ControlLightMaps(true);
        //dayCycle = DayCycles.Sunrise; // start with sunrise state
        //globalLight.color = sunrise; // start global color at sunrise
        if (hours >= 6 && hours < 8)
        {
            dayCycle = DayCycles.Sunrise;
        }
        else if (hours >= 8 && hours < 18)
        {
            dayCycle = DayCycles.Day;
        }
        else if (hours >= 18 && hours < 20)
        {
            dayCycle = DayCycles.Sunset;
        }
        else if (hours >= 20 && hours < 22)
        {
            dayCycle = DayCycles.Night;
        }
        else if (hours >= 22 || hours < 6)
        {
            dayCycle = DayCycles.Midnight;
        }

    }

     void Update()
     {
        seconds += Time.deltaTime;

        if(seconds > 2)
        {
            minutes += 10;
            seconds = 0;
        }

        if (minutes >= 60)
        {
            hours += 1;
            minutes = 0;
            if(hours >= 24)
            {
                hours = 0;
            }
        }

        if(hours < 10 && minutes < 10)
        {
            TimeOnScreen.text = "0"+hours.ToString()+":0"+minutes.ToString();
        }
        else if(hours < 10 && minutes >= 10)
        {
            TimeOnScreen.text = "0"+hours.ToString() + ":" + minutes.ToString();
        }
        else if(hours >= 10 && minutes < 10)
        {
            TimeOnScreen.text = hours.ToString() + ":0" + minutes.ToString();
        }
        else
            TimeOnScreen.text = hours.ToString() + ":" + minutes.ToString();


        // Check if cycle time reach cycle duration time
        if (hours >= 6 && hours < 8) 
        {
            Nature.UnPause();
            NatureNight.Pause();
            dayCycle = DayCycles.Sunrise;
        }
        else if(hours >= 8 && hours < 18)
        {
            dayCycle = DayCycles.Day;
        }
        else if (hours >= 18 && hours < 20)
        {
            dayCycle = DayCycles.Sunset;
        }
        else if (hours >= 20 && hours < 22)
        {
            Nature.Pause();
            NatureNight.UnPause();
            dayCycle = DayCycles.Night;
        }
        else if (hours >= 22 || hours < 6)
        {
            dayCycle = DayCycles.Midnight;
        }

        if((hours == 6 && minutes == 0)|| (hours == 8 && minutes == 0) || (hours == 18 && minutes == 0) || (hours == 20 && minutes == 0) || (hours == 22 && minutes == 0))
        {
            x = 0;
        }

        x += Time.deltaTime;

        // percent it's an value between current and max time to make a color lerp smooth
        float percent = x/10;

        // Sunrise state (you can do a lot of stuff based on every cycle state, like enable animals only in sunrise )
        if(dayCycle == DayCycles.Sunrise)
        {
            ControlLightMaps(false); // disable map light (keep enable only at night)
            globalLight.color = Color.Lerp(midnight, sunrise, percent);
        }

        // Mid Day state
        if(dayCycle == DayCycles.Day)
        {
            ControlLightMaps(false);
            globalLight.color = Color.Lerp(sunrise, day, percent);
        }

        // Sunset state
        if(dayCycle == DayCycles.Sunset)
        {
            ControlLightMaps(false);
            globalLight.color = Color.Lerp(day, sunset, percent);
        }

        // Night state
        if(dayCycle == DayCycles.Night)
        {
            ControlLightMaps(true); // enable map lights (disable only in day states)
            globalLight.color = Color.Lerp(sunset, night, percent);        
        }

        // Midnight state
        if(dayCycle == DayCycles.Midnight)
        {
            ControlLightMaps(true);
            globalLight.color = Color.Lerp(night, midnight, percent);
        } 
     }

     void ControlLightMaps(bool status)
     {
         // loop in light array of objects to enable/disable
         if(mapLights.Length > 0)
            foreach(UnityEngine.Rendering.Universal.Light2D _light in mapLights)
                _light.gameObject.SetActive(status);
     }
}
