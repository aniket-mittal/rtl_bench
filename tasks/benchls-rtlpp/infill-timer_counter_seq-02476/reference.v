module rtlpp_02476(
    input start,            
    output rfd,            
    input [7:0] phs,        
    input iv,                
    input iocs,            
    input [2:0] ioaddr,    
    input [15:0] din,    
    output [15:0] dout,    
    input iowr, iord,        
    input clk, rst            
);

wire first, last;        
reg [3:0] z;            
reg [7:0] n;            
wire zce, nce;            
reg dzce, dnce;            
wire [1:0] p0, p1, p2, p3, p4, p5, p6, p7;    
wire acsv, tbmv;        
wire [9:0] symbols;    
wire [7:0] d0, d1;        
reg readsym;            
wire [15:0] data, status;    
reg [15:0] omux;        
reg [3:0] zsc;            
reg [7:0] nsc;            

wire s1;
assign s1 = iocs & (ioaddr[2:0] == 1);

always @ (posedge clk)
begin
    if (rst) nsc <= 0;    
    else if (iowr & iocs) nsc <= din[7:0];
    if (rst) zsc <= 0;    
    else if (iowr & iocs) zsc <= din[11:8];
end

always @ (posedge clk)
begin
    if (rst) z <= 0;            
    else if (start) z <= zsc;
    else if (iv & zce) z <= z - 1'b1;
    if (iv) dzce <= zce;        
    if (rst) n <= 0;            
    else if (start) n <= nsc;
    else if (iv & nce) n <= n - 1'b1;
    dnce <= nce;                
end

assign zce = |z;    
assign nce = |n;
assign first = iv & dzce;    
assign last = dnce & ~nce;    
assign rfd = nce;                

// Embedded acs8x4x16 module functionality
reg [1:0] state_p0, state_p1, state_p2, state_p3, state_p4, state_p5, state_p6, state_p7;
always @ (posedge clk or posedge rst)
begin
    if (rst)
    begin
        state_p0 <= 0;
        state_p1 <= 0;
        state_p2 <= 0;
        state_p3 <= 0;
        state_p4 <= 0;
        state_p5 <= 0;
        state_p6 <= 0;
        state_p7 <= 0;
    end
    else if (iv & ~zce)
    begin
        state_p0 <= phs[1:0];
        state_p1 <= phs[3:2];
        state_p2 <= phs[5:4];
        state_p3 <= phs[7:6];
        state_p4 <= phs[1:0];
        state_p5 <= phs[3:2];
        state_p6 <= phs[5:4];
        state_p7 <= phs[7:6];
    end
end

assign p0 = state_p0;
assign p1 = state_p1;
assign p2 = state_p2;
assign p3 = state_p3;
assign p4 = state_p4;
assign p5 = state_p5;
assign p6 = state_p6;
assign p7 = state_p7;

assign acsv = iv & ~zce;

always @ (posedge clk)
begin
    readsym <= iord & s1;
end

// Embedded tbm1024x8 module functionality
reg [7:0] sym_d0, sym_d1;
reg [9:0] sym_symbols;
reg sym_tbmv;
always @ (posedge clk or posedge rst)
begin
    if (rst)
    begin
        sym_d0 <= 0;
        sym_d1 <= 0;
        sym_symbols <= 0;
        sym_tbmv <= 0;
    end
    else if (acsv)
    begin
        sym_d0 <= {p0, p1, p2, p3};
        sym_d1 <= {p4, p5, p6, p7};
        sym_symbols <= {p0, p1, p2, p3, p4, p5, p6, p7};
        sym_tbmv <= 1;
    end
    else if (last)
    begin
        sym_symbols <= 0;
        sym_tbmv <= 0;
    end
end

assign d0 = sym_d0;
assign d1 = sym_d1;
assign symbols = sym_symbols;
assign tbmv = sym_tbmv;

assign data = {d1[7], d0[7], d1[6], d0[6], d1[5], d0[5], d1[4], d0[4], d1[3], d0[3], d1[2], d0[2], d1[1], d0[1], d1[0], d0[0]};
assign status = {tbmv, 5'b00000, symbols};
always @ (posedge clk) omux <= ioaddr[1] ? status : data;
assign dout = omux;

endmodule