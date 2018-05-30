using UnityEngine;
using UnityEngine.Collections;

public class testrotate : MonoBehaviour {

    private MeshFilter[] lista;
    private int cant;

    private Transform temp;
    private Quaternion rot;

    void Start()
    {
        lista = FindObjectsOfType<MeshFilter>();
        cant = lista.Length;
    }

    // Update is called once per frame
    void FixedUpdate () {
        for (int i = 0; i < cant; i++)
        {
            temp = lista[i].transform;
            rot = Quaternion.Euler(Random.Range(-1f, 1f), Random.Range(-1f, 1f), Random.Range(-1f, 1f));

            temp.Rotate(Random.Range(-1f, 1f), Random.Range(-1f, 1f), Random.Range(-1f, 1f));
            //temp.SetPositionAndRotation(temp.position, temp.rotation * rot);  // este parece un poquito mas rapido...
        }

    }
}
