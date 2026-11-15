module origen_064112 #(
    parameter WIDTH = 8
)(
    input wire Enable,
    input wire Clk,
    input wire Clr,
    output reg [WIDTH-1:0] Q, Q1, Q2, Q3, Q4, Q5
);

    always @(posedge Clk or negedge Clr) begin
        if (!Clr) begin
            Q <= 0;
            Q1 <= 0;
            Q2 <= 0;
            Q3 <= 0;
            Q4 <= 0;
            Q5 <= 0;
        end else if (Enable) begin
            if (Q == 9) begin
                Q <= 0;
                if (Q1 == 5) begin
                    Q1 <= 0;
                    if (Q2 == 9) begin
                        Q2 <= 0;
                        if (Q3 == 5) begin
                            Q3 <= 0;
                            if (Q4 == 9) begin
                                Q4 <= 0;
                                if (Q5 == 5) begin
                                    Q5 <= 0;
                                end else begin
                                    Q5 <= Q5 + 1;
                                end
                            end else begin
                                Q4 <= Q4 + 1;
                            end
                        end else begin
                            Q3 <= Q3 + 1;
                        end
                    end else begin
                        Q2 <= Q2 + 1;
                    end
                end else begin
                    Q1 <= Q1 + 1;
                end
            end else begin
                Q <= Q + 1;
            end
        end
    end

endmodule