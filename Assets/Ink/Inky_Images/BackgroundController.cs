using UnityEngine;
using UnityEngine.UI;
using System.Collections.Generic;

public class BackgroundController : MonoBehaviour
{
    public Image backgroundImage;

    [System.Serializable]
    public class BackgroundEntry
    {
        public string tagName;
        public Sprite sprite;
    }

    public List<BackgroundEntry> backgroundEntries;

    private Dictionary<string, Sprite> bgLookup;

    void Awake()
    {
        // Initialize dictionary from list
        bgLookup = new Dictionary<string, Sprite>();
        foreach (var entry in backgroundEntries)
        {
            if (!bgLookup.ContainsKey(entry.tagName))
            {
                bgLookup.Add(entry.tagName, entry.sprite);
            }
        }
    }

    public void SetBackground(string tag)
    {
        if (bgLookup.ContainsKey(tag))
        {
            backgroundImage.sprite = bgLookup[tag];
        }
        else
        {
            Debug.LogWarning($"No background found for tag: {tag}");
        }
    }
}
