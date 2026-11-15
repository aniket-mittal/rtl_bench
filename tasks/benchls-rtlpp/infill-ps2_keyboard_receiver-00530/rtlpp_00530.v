module rtlpp_00530(
                Clk,
                Reset,
                PS2_Clk,
                PS2_Data,
                DoRead,
                Scan_Err,
                Scan_DAV,
                Scan_Code
                );

input Clk;
input Reset;
input PS2_Clk;
input PS2_Data;
input DoRead;

output Scan_Err;
output Scan_DAV;
output[7:0] Scan_Code;

wire   Clk;
wire   Reset;
wire   PS2_Clk;
wire   PS2_Data;
wire   DoRead;
reg   Scan_Err;
wire   Scan_DAV;
reg  [7:0] Scan_Code;

reg  PS2_Datr;
reg [7:0] Filter;
reg  Fall_Clk;
reg [3:0] Bit_Cnt;
reg  Parity;
reg  Scan_DAVi;
reg [8:0] S_Reg;
reg  PS2_Clk_f;

parameter Idle = 1'b0, Shifting = 1'b1;
reg State;

assign Scan_DAV = Scan_DAVi;

always @(posedge Clk or posedge Reset) begin
    if(Reset) begin
        PS2_Datr <= 1'b0;
        PS2_Clk_f <= 1'b0;
        Filter <= 8'b0;
        Fall_Clk <= 1'b0;
    end else begin
        PS2_Datr <= PS2_Data;

        Fall_Clk <= 1'b0;
        Filter <= {PS2_Clk, Filter[7:1]};
        if(Filter == 8'hFF) begin
            PS2_Clk_f <= 1'b1;
        end else if(Filter == 8'h00) begin
            PS2_Clk_f <= 1'b0;
            if(PS2_Clk_f) begin
                Fall_Clk <= 1'b1;
            end
        end
    end
end

[MASKED]

endmodule