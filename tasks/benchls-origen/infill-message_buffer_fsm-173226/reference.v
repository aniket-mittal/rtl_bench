module origen_173226(
    input [7:0] DATA,
    output reg msg_req,
    input sending,
    input dready,
    output reg dacpt,
    input clock,
    input reset
);

    reg [7:0] nextdata [7:0];
    reg [2:0] addr = 0;
    reg [31:0] delay;

    parameter RS1 = 2'b00, RS2 = 2'b01, RS3 = 2'b10, other = 2'b11;
    reg [1:0] state = other;

    always @(posedge clock or posedge reset) begin
        if (reset) begin
            state <= other;
        end else begin
            case (state)
                RS1: begin
                    msg_req <= 1;
                    addr <= 0;
                    state <= RS2;
                end
                RS2: begin
                    if (dready) begin
                        nextdata[addr] <= DATA;
                        ;
                        addr <= addr + 1;
                        dacpt <= 1;
                        state <= RS3;
                    end
                end
                RS3: begin
                    dacpt <= 0;
                    if (sending) begin
                        state <= RS2;
                    end else begin
                        state <= other;
                    end
                end
                other: begin
                    delay <= $random % 1000000;
                    ;
                    #delay state <= RS1;
                end
            endcase
        end
    end

endmodule