module rtlpp_09526(iocs, ioaddr, din, dout, iord, iowr, clk, rst);
    input iocs;				
    input [2:0] ioaddr;	
    input [15:0] din;		
    output reg [15:0] dout;	
    input iord;				
    input iowr;				
    input clk;				
    input rst;				

    reg [3:0] mag;				
    wire [1:0] u;				
    wire iv;						
    reg [3:0] s0;				
    reg [1:0] s1;				
    reg [7:0] e0, e1, e2, e3;	
    reg [3:0] c;				
    wire [1:0] g;				
    wire [2:0] d;	
    reg [15:0] e;				

    always @(posedge clk)
    begin
        if (rst)
            mag <= 4'h0;	
        else if (iocs & iowr & (ioaddr == 1))
            mag <= din[7:4];
        if (iocs & iowr & (ioaddr == 4))
            e0 <= din[7:0];
        if (iocs & iowr & (ioaddr == 5))
            e1 <= din[7:0];
        if (iocs & iowr & (ioaddr == 6))
            e2 <= din[7:0];
        if (iocs & iowr & (ioaddr == 7))
            e3 <= din[7:0];
    end

    assign u = din[1:0];
    assign iv = iocs & iowr & (ioaddr == 0);

    always @(posedge clk)
    begin
        if (rst)
            s0 <= 0;
        else if (iv)
            s0 <= {s0[2:0], u[0]};
        if (rst)
            s1 <= 0;
        else if (iv)
            s1 <= {s1[0], u[1]};
    end

    always @(posedge clk)
    begin
        if (iv) begin
            c[0] <= (u[1] & e0[7]) ^ (s1[0] & e0[6]) ^ (s1[1] & e0[5]) ^ (u[0] & e0[4]) ^ (s0[0] & e0[3]) ^ (s0[1] & e0[2]) ^ (s0[2] & e0[1]) ^ (s0[3] & e0[0]);
            c[1] <= (u[1] & e1[7]) ^ (s1[0] & e1[6]) ^ (s1[1] & e1[5]) ^ (u[0] & e1[4]) ^ (s0[0] & e1[3]) ^ (s0[1] & e1[2]) ^ (s0[2] & e1[1]) ^ (s0[3] & e1[0]);
            c[2] <= (u[1] & e2[7]) ^ (s1[0] & e2[6]) ^ (s1[1] & e2[5]) ^ (u[0] & e2[4]) ^ (s0[0] & e2[3]) ^ (s0[1] & e2[2]) ^ (s0[2] & e2[1]) ^ (s0[3] & e2[0]);
            c[3] <= (u[1] & e3[7]) ^ (s1[0] & e3[6]) ^ (s1[1] & e3[5]) ^ (u[0] & e3[4]) ^ (s0[0] & e3[3]) ^ (s0[1] & e3[2]) ^ (s0[2] & e3[1]) ^ (s0[3] & e3[0]);
        end
    end

    assign g[1] = c[2] ^ c[1];
    assign g[0] = c[0] ^ g[1];

    assign d[2] = c[2];
    assign d[1:0] = ioaddr[1] ? g[1:0] : c[1:0];

    always @(posedge clk)
    begin
        if (iord)
            e <= {mag, 4'h0, (ioaddr[0] ? {c[3], 2'b00} : d[2:0]), 5'b00000};
    end

    always @(posedge clk)
    begin
        dout <= e;
    end
endmodule