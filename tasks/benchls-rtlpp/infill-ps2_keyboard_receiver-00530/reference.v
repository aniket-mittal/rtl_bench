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

always @(posedge Clk or posedge Reset) begin
    if(Reset) begin
        State <= Idle;
        Bit_Cnt <= 4'b0;
        S_Reg <= 9'b0;
        Scan_Code <= 8'b0;
        Parity <= 1'b0;
        Scan_DAVi <= 1'b0;
        Scan_Err <= 1'b0;
    end else begin
        if(DoRead) begin
            Scan_DAVi <= 1'b0;
        end
        case(State)
            Idle: begin
                Parity <= 1'b0;
                Bit_Cnt <= 4'b0;
                if(Fall_Clk && !PS2_Datr) begin
                    Scan_Err <= 1'b0;
                    State <= Shifting;
                end
            end
            Shifting: begin
                if(Bit_Cnt >= 4'b1001) begin
                    if(Fall_Clk) begin
                        Scan_Err <= ~Parity | ~PS2_Datr | Scan_DAVi;
                        Scan_DAVi <= 1'b1;
                        Scan_Code <= S_Reg[7:0];
                        State <= Idle;
                    end
                end else if(Fall_Clk) begin
                    Bit_Cnt <= Bit_Cnt + 1'b1;
                    S_Reg <= {PS2_Datr, S_Reg[8:1]};
                    Parity <= Parity ^ PS2_Datr;
                end
            end
            default: begin
                State <= Idle;
            end
        endcase
    end
end

endmodule