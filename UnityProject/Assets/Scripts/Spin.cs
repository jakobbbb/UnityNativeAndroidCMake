using UnityEngine;
using System.Runtime.InteropServices;

public class Spin : MonoBehaviour
{
    [DllImport("NativePlugin")]
    private static extern int example_function();

    // Start is called once before the first execution of Update after the MonoBehaviour is created
    void Start()
    {
    }

    // Update is called once per frame
    void Update()
    {
        var ax = 3 * Vector3.up + 2 * Vector3.left + Vector3.forward;
        this.transform.RotateAround(this.transform.position, ax, example_function() * Time.deltaTime);
    }
}
