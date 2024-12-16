using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Verify : MonoBehaviour
{
    public bool happy = false;
    [SerializeField] private TextAsset inkJSON;

    private void OnTriggerEnter2D(Collider2D collision)
    {
        if(happy == false)
        {
            DialogueManager.GetInstance().EnterDialogueMode(inkJSON);
            collision.transform.position = new Vector2(collision.transform.position.x - 2, collision.transform.position.y);
        }
    }
}
