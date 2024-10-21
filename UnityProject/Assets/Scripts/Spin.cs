using UnityEngine;

public class Spin : MonoBehaviour
{
    // Start is called once before the first execution of Update after the MonoBehaviour is created
    void Start()
    {
    }

    // Update is called once per frame
    void Update()
    {
        var ax = 3 * Vector3.up + 2 * Vector3.left + Vector3.forward;
        this.transform.RotateAround(this.transform.position, ax, 100.0f * Time.deltaTime);
    }
}
