module origen_186479(
    input        Clk,
    input        Reset,
    input        PS2_Clk,
    input        PS2_Data,
    input        DoRead,
    output       Scan_Err,
    output       Scan_DAV,
    output [7:0] Scan_Code
);

reg        PS2_Datr;
reg [7:0]  Filter;
wire       Fall_Clk;
reg [3:0]  Bit_Cnt;
reg        Parity;
reg        Scan_DAVi;
reg [8:0]  S_Reg;
wire       PS2_Clk_f;
reg [1:0]  State;

parameter IDLE = 2'b00, SHIFTING = 2'b01;

always @(posedge Clk or posedge Reset) begin
    if (Reset) begin
        PS2_Datr <= 1'b0;
        Filter   <= 8'hFF;
        Bit_Cnt  <= 4'b0;
        Parity   <= 1'b0;
        Scan_DAVi<= 1'b0;
        S_Reg    <= 9'b0;
        State    <= IDLE;
    end
    else begin
        PS2_Datr <= PS2_Data;
        Filter   <= {Filter[6:0], PS2_Clk};
        Bit_Cnt  <= (State == SHIFTING) ? Bit_Cnt + 1'b1 : 4'b0;
        Parity   <= (State == SHIFTING) ? Parity ^ PS2_Datr : 1'b0;
        Scan_DAVi<= (State == IDLE && Fall_Clk && PS2_Datr == 1'b0) ? 1'b1 : 
                    (DoRead) ? 1'b0 : Scan_DAVi;
        S_Reg    <= (State == SHIFTING) ? {S_Reg[7:0], PS2_Datr} : 9'b0;
        State    <= (State == IDLE && Fall_Clk && PS2_Datr == 1'b0) ? SHIFTING :
                    (Bit_Cnt == 4'd9) ? IDLE : State;
    end
end

assign Fall_Clk = (Filter == 8'h00);
assign PS2_Clk_f= (Filter == 8'h00);
assign Scan_Err = (Bit_Cnt == 4'd9) ? (Parity ^ S_Reg[0] | S_Reg[8]) : 1'b0;
assign Scan_DAV = Scan_DAVi;
assign Scan_Code= S_Reg[7:0];

endmodule