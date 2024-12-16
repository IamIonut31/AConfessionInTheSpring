using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class Player : PhysicsObject
{
    [Header("Attributes")]
    [SerializeField] private float maxSpeed = 1;
    [SerializeField] private float jumpPower = 10;

    [Header("References")]
    [SerializeField] private TextAsset inkJSON;
    [SerializeField] private Animator anim;
    [SerializeField] private AudioSource JumpSound;
    public Dictionary<string, Sprite> inventory = new Dictionary<string, Sprite>();
    public Image inventoryItemImage;
    public Sprite moneySprite;
    public Sprite flowersSprite;
    public Sprite balloonSprite;
    public Sprite curtainsSprite;
    public Sprite hatSprite;
    public Sprite carrotSprite;
    public Sprite happySprite;

    // Start is called before the first frame update
    void Start()
    {
        StartCoroutine(StartDialogue());
    }

    // Update is called once per frame
    void Update()
    {
        if(DialogueManager.GetInstance().dialogueIsPlaying)
        {
            if(!anim.GetCurrentAnimatorStateInfo(0).IsName("Idle"))
            {
                anim.SetBool("grounded", true);
                anim.SetFloat("velocityX", 0);
                anim.Play("Idle");
            }
            targetVelocity = new Vector2(0, 0);
            return;
        }

        Vector2 moveDirection = InputManager.GetInstance().GetMoveDirection();
        targetVelocity = new Vector2(moveDirection.x * maxSpeed, 0);
        bool jumpPressed = InputManager.GetInstance().GetJumpPressed();
        if (jumpPressed && grounded)
        {
            velocity.y = jumpPower;
            JumpSound.Play();
        }

        if (targetVelocity.x < -.01)
        {
            transform.localScale = new Vector2(-1f, 1f);
        }
        else if (targetVelocity.x > .01)
        {
            transform.localScale = new Vector2(1f, 1f);
        }

        anim.SetFloat("velocityX", Mathf.Abs(velocity.x) / maxSpeed);
        anim.SetFloat("velocityY", velocity.y);
        anim.SetBool("grounded", grounded);
    }

    public void AddInventoryItem(string inventoryItemName, Sprite image)
    {
        inventory.Add(inventoryItemName, image);
        inventoryItemImage.sprite = inventory[inventoryItemName];
        inventoryItemImage.color = new Color(255, 255, 255, 255);
    }

    private IEnumerator StartDialogue()
    {
        yield return new WaitForSeconds(1f);
        DialogueManager.GetInstance().EnterDialogueMode(inkJSON);
    }
}
