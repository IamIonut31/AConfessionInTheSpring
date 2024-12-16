using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using TMPro;

public class Teleport : MonoBehaviour
{
    [SerializeField] private float PosX;
    [SerializeField] private float PosY;
    [SerializeField] private GameObject Text;
    
    private void OnTriggerStay2D(Collider2D collision)
    {
        if (InputManager.GetInstance().GetInteractPressed())
        {
            collision.transform.position = new Vector2(PosX, PosY);
            Text.SetActive(false);
        }
    }
    private void OnTriggerExit2D(Collider2D collision)
    {
        Text.SetActive(false);
    }
    private void OnTriggerEnter2D(Collider2D collision)
    {
        Text.SetActive(true);
    }
}
