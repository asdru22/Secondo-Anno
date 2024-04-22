1. 
```java
int fermateMin(int d[0,...,n-1],int K, int C){
	int res = K*C
	int i = 0, f = 0
	while(i<n){
		if(res<d[i]){
			res = C*K
			f = f+1
		}
		res = res - d[i]
		if(res<0) return -1
		i = i+1
	}
	return f
}
```

2. 