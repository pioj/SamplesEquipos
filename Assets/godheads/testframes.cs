using UnityEngine;

public class testframes : MonoBehaviour {

    public uint cubos;
    public bool UpdateCubes = true;
    private testrotate myComp;

    void Awake()
    {
        for (int i = 0; i < cubos; i++) {
            GameObject nodo = GameObject.CreatePrimitive(PrimitiveType.Cube);
            Destroy(nodo.GetComponent<BoxCollider>());
            nodo.transform.localPosition = new Vector3(Random.Range(-5f, 5f), Random.Range(-5f, 5f), Random.Range(-5f, 5f));
        }
        myComp = FindObjectOfType<testrotate>();
    }

    void Update() {
        //if (skipUpdate) myComp.enabled = false;
        myComp.enabled = UpdateCubes;
        
    }
}