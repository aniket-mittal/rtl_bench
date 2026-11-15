module origen_026706 (
    input wire start,
    input wire clka,
    input wire ActiveDoneSignal,
    output reg ActiveDapapath,
    output reg done,
    output reg reset
);

    // State encoding
    localparam S0 = 3'b000;
    localparam S1 = 3'b001;
    localparam S2 = 3'b010;

    reg [2:0] stage;

    always @(posedge clka or posedge start) begin
        if (start) begin
            stage <= S0;
        end else begin
            case (stage)
                S0: stage <= S2;
                S1: stage <= S2;
                S2: stage <= start ? S0 : S1;
                default: stage <= S1;
            endcase
        end
    end

    always @(*) begin
        case (stage)
            S0: begin
                ActiveDapapath = 1'b1;
                reset = 1'b0;
                done = 1'b0;
            end
            S1: begin
                ActiveDapapath = 1'b0;
                reset = 1'b1;
                done = 1'b0;
            end
            S2: begin
                ActiveDapapath = 1'b0;
                reset = 1'b0;
                done = ActiveDoneSignal;
            end
            default: begin
                ActiveDapapath = 1'b0;
                reset = 1'b1;
                done = 1'b0;
            end
        endcase
    end

endmodule