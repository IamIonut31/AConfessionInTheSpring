using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class RoomTransition : MonoBehaviour
{
    [SerializeField] private Animator Exterior;
    [SerializeField] private Animator Interior;

    private void OnTriggerEnter2D(Collider2D collision)
    {
        Exterior.Play("Exit");
        Interior.Play("Enter");
    }
    private void OnTriggerExit2D(Collider2D collision)
    {
        Interior.Play("Exit");
        Exterior.Play("Enter");
    }
}
