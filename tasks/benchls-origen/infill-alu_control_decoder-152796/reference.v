module origen_152796(
    input aluop1,
    input aluop0,
    input f3,
    input f2,
    input f1,
    input f0,
    input ORIidentifierSignal,
    input bneal_identifier,
    output reg [2:0] gout
);

always @(*) begin
    if (ORIidentifierSignal) begin
        gout = 3'b001;
    end
    else if (bneal_identifier) begin
        gout = 3'b110;
    end
    else if (aluop0) begin
        gout = 3'b110;
    end
    else if (aluop1) begin
        if (!f3 && !f2 && !f1 && !f0) begin
            gout = 3'b010;
        end
        else if (f1 && f3) begin
            gout = 3'b111;
        end
        else if (f1 && !f3) begin
            gout = 3'b110;
        end
        else if (f2 && f0) begin
            gout = 3'b001;
        end
        else if (f2 && !f0) begin
            gout = 3'b000;
        end
        else if (!f3 && f2 && f1 && !f0) begin
            gout = 3'b011;
        end
        else begin
            gout = 3'b010;
        end
    end
    else begin
        gout = 3'b010;
    end
end

endmodule