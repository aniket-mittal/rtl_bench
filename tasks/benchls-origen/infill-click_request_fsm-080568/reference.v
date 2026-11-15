module origen_080568 (
    input wire clk,
    input wire nRST,
    input wire RXdone,
    output reg req
);

    // State encoding
    localparam WAITFORRXDONE = 3'b000;
    localparam RXDONE = 3'b001;
    localparam REQUESTFOAM = 3'b010;
    localparam CLR = 3'b011;

    // Internal registers
    reg [2:0] cntclick;
    reg [2:0] st;

    // FSM logic
    always @(posedge clk or negedge nRST) begin
        if (!nRST) begin
            st <= WAITFORRXDONE;
            cntclick <= 3'b000;
            req <= 1'b0;
        end else begin
            case (st)
                WAITFORRXDONE: begin
                    if (!RXdone) begin
                        st <= REQUESTFOAM;
                    end
                end

                REQUESTFOAM: begin
                    req <= 1'b1;
                    cntclick <= cntclick + 1'b1;
                    if (cntclick == 3'b101) begin
                        st <= CLR;
                    end
                end

                CLR: begin
                    req <= 1'b0;
                    cntclick <= 3'b000;
                    st <= RXDONE;
                end

                RXDONE: begin
                    if (RXdone) begin
                        st <= WAITFORRXDONE;
                    end
                end

                default: st <= WAITFORRXDONE;
            endcase
        end
    end

endmodule