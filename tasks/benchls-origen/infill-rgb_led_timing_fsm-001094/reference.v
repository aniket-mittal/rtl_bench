module origen_001094(
    input wire clk,
    input wire reset,
    output reg [2:0] RGB1,
    output reg [2:0] RGB2
);

    // State definitions
    localparam [2:0] A1 = 3'b000,
                     A2 = 3'b001,
                     A3 = 3'b010,
                     B2 = 3'b011;

    // Timing parameters
    localparam [3:0] t1 = 4'b1011,
                     t2 = 4'b0100;

    reg [2:0] state;
    reg [3:0] counter;

    // Sequential block
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            state <= A1;
            counter <= 4'b0000;
        end else begin
            case (state)
                A1: begin
                    if (counter == t1) begin
                        state <= A2;
                        counter <= 4'b0000;
                    end else begin
                        counter <= counter + 1;
                    end
                end
                A2: begin
                    if (counter == t2) begin
                        state <= A3;
                        counter <= 4'b0000;
                    end else begin
                        counter <= counter + 1;
                    end
                end
                A3: begin
                    if (counter == t1) begin
                        state <= B2;
                        counter <= 4'b0000;
                    end else begin
                        counter <= counter + 1;
                    end
                end
                B2: begin
                    if (counter == t2) begin
                        state <= A1;
                        counter <= 4'b0000;
                    end else begin
                        counter <= counter + 1;
                    end
                end
                default: state <= A1;
            endcase
        end
    end

    // Combinational block
    always @(*) begin
        case (state)
            A1: begin
                RGB1 = 3'b010; // Green
                RGB2 = 3'b100; // Red
            end
            A2: begin
                RGB1 = 3'b110; // Yellow
                RGB2 = 3'b100; // Red
            end
            A3: begin
                RGB1 = 3'b100; // Red
                RGB2 = 3'b010; // Green
            end
            B2: begin
                RGB1 = 3'b100; // Red
                RGB2 = 3'b110; // Yellow
            end
            default: begin
                RGB1 = 3'b000; // Off
                RGB2 = 3'b000; // Off
            end
        endcase
    end

endmodule