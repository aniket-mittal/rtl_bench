module origen_038759 #(
    parameter busytime = 10
) (
    input wire Clock,
    input wire Reset,
    input wire Start,
    output reg Busy,
    output reg End
);

    reg [31:0] counter;
    reg [1:0] state;

    localparam IDLE = 2'b00;
    localparam BUSY = 2'b01;
    localparam END_PULSE = 2'b10;

    always @(posedge Clock or posedge Reset) begin
        if (Reset) begin
            state <= IDLE;
            Busy <= 1'b0;
            End <= 1'b0;
            counter <= 32'd0;
        end else begin
            case (state)
                IDLE: begin
                    if (Start) begin
                        state <= BUSY;
                        Busy <= 1'b1;
                        counter <= 32'd0;
                    end
                end
                BUSY: begin
                    if (counter == busytime - 1) begin
                        state <= END_PULSE;
                        End <= 1'b1;
                        Busy <= 1'b0;
                    end else begin
                        counter <= counter + 1;
                    end
                end
                END_PULSE: begin
                    state <= IDLE;
                    End <= 1'b0;
                end
                default: state <= IDLE;
            endcase
        end
    end

endmodule