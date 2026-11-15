module origen_087503 (
    input wire Clk,
    input wire Start,
    input wire Reset,
    input wire [4:0] Count,
    input wire [63:0] WordIn,
    output reg [4:0] AddressIn,
    output reg [63:0] WordOut,
    output reg Valid
);

    // State definition
    localparam RESET_STATE = 1'b0;
    localparam ACTIVE_STATE = 1'b1;
    
    reg state;

    // Initialize AddressIn
    initial begin
        AddressIn = 5'b00001;
    end

    always @(posedge Clk or negedge Reset) begin
        if (!Reset) begin
            // Reset condition
            AddressIn <= Count + 1;
            WordOut <= 64'b0;
            Valid <= 1'b0;
            state <= RESET_STATE;
        end
        else begin
            case (state)
                RESET_STATE: begin
                    if (Start) begin
                        state <= ACTIVE_STATE;
                        AddressIn <= Count;
                        WordOut <= WordIn;
                        Valid <= 1'b1;
                    end
                end
                
                ACTIVE_STATE: begin
                    if (Start) begin
                        AddressIn <= Count;
                        WordOut <= WordIn;
                        Valid <= 1'b1;
                    end
                    else begin
                        Valid <= 1'b0;
                    end
                end
            endcase
        end
    end

endmodule