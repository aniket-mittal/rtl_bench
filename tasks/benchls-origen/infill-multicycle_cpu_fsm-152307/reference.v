module origen_152307 (
    input clock,
    input reset,
    input Aeq0,
    input Apos,
    input enter,
    input [2:0] ir,
    output reg IRload,
    output reg JMPmux,
    output reg PCload,
    output reg Meminst,
    output reg MemWr,
    output reg [1:0] Asel,
    output reg Aload,
    output reg Sub,
    output reg Halt,
    output reg [3:0] showstate
);

    parameter s0 = 4'b0000, s1 = 4'b0001, s2 = 4'b0010, s3 = 4'b0011, s4 = 4'b0100;
    parameter s5 = 4'b0101, s6 = 4'b0110, s7 = 4'b0111, s8 = 4'b1000, s9 = 4'b1001;
    parameter s10 = 4'b1010;

    reg [3:0] state;
    wire light;

    always @(posedge clock, posedge reset) begin
        if (reset) begin
            state <= s0;
        end else begin
            case (state)
                s0: begin
                    if (enter) begin
                        state <= s1;
                    end else begin
                        state <= s0;
                    end
                end
                s1: begin
                    state <= s2;
                end
                s2: begin
                    state <= s3;
                end
                s3: begin
                    IRload <= 1;
                    Meminst <= 1;
                    Aload <= 1;
                    state <= s4;
                end
                s4: begin
                    IRload <= 0;
                    Meminst <= 0;
                    Aload <= 0;
                    case (ir)
                        3'b000: state <= s5;
                        3'b001: state <= s6;
                        3'b010: state <= s7;
                        3'b011: state <= s8;
                        3'b100: state <= s9;
                        3'b101: state <= s10;
                        default: state <= s0;
                    endcase
                end
                s5: begin
                    Asel <= 2'b00;
                    state <= s0;
                end
                s6: begin
                    Asel <= 2'b01;
                    Sub <= 1;
                    state <= s0;
                end
                s7: begin
                    Asel <= 2'b10;
                    JMPmux <= 1;
                    PCload <= 1;
                    state <= s0;
                end
                s8: begin
                    if (Aeq0) begin
                        Halt <= 1;
                    end else if (Apos) begin
                        Halt <= 0;
                    end
                    state <= s0;
                end
                s9: begin
                    MemWr <= 1;
                    state <= s0;
                end
                s10: begin
                    MemWr <= 0;
                    state <= s0;
                end
                default: state <= s0;
            endcase
        end
    end

    assign showstate = state;
endmodule