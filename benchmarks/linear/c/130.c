
int main() {
    int d1 = 1;
    int d2 = 1;
    int d3 = 1;
    int x1;
    int x2;
    int x3;

    assume(x1 >= 1);
    assume(x2 >= x1);
    assume(x3 >= x1);

    while( x1 > 0) {
        if(x2 > 0) {
            if(x3 > 0) {
                x1 = x1 - d1;
                x2 = x2 - d2;
                x3 = x3 - d3;
            }
        }
    }

    assert (x2 >= 0);
    //assert (x3 >= 0);
}
