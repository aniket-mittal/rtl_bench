module origen_042137(q, q1, j, k, c);
    output reg q, q1;
    input j, k, c;
    
    initial begin
        q = 1'b0;
        q1 = 1'b1;
    end
    
    [MASKED]
endmodule

module contAssincDecresc(s, pulse, um);
    output [4:0] s;
    input pulse, um;
    wire [4:0] q1;
    
    jkff ff0(s[0], q1[0], um, um, pulse);
    jkff ff1(s[1], q1[1], um, um, q1[0]);
    jkff ff2(s[2], q1[2], um, um, q1[1]);
    jkff ff3(s[3], q1[3], um, um, q1[2]);
    jkff ff4(s[4], q1[4], um, um, q1[3]);
endmodule

module testContAssincDecresc;
    wire [4:0] s;
    reg pulse, um;
    
    contAssincDecresc counter(s, pulse, um);
    
    initial begin
        $monitor("Time=%0t pulse=%b um=%b s=%b (%d)", $time, pulse, um, s, s);
        um = 0;
        pulse = 0;
        #5 um = 1;
        #5 pulse = 1;
        #5 pulse = 0;
        #5 pulse = 1;
        #5 pulse = 0;
        #5 pulse = 1;
        #5 pulse = 0;
        #5 pulse = 1;
        #5 pulse = 0;
        #5 pulse = 1;
        #5 pulse = 0;
        #5 ;
    end
endmodule