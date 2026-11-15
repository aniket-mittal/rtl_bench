module origen_089449 (
    input D, ECLK, SCLK, CE, RST, DDRCLKPOL,
    output reg QA, QB
);

    reg QN0, QP0, QN1;
    wire sclk_pol;

    // Clock polarity control
    assign sclk_pol = DDRCLKPOL ? ~SCLK : SCLK;

    // Data capture
    always @(negedge ECLK or posedge RST) begin
        if (RST)
            QN0 <= 1'b0;
        else if (ECLK === 1'bx)
            QN0 <= 1'bx;
        else
            QN0 <= D;
    end

    always @(posedge ECLK or posedge RST) begin
        if (RST)
            QP0 <= 1'b0;
        else if (ECLK === 1'bx)
            QP0 <= 1'bx;
        else
            QP0 <= D;
    end

    always @(negedge ECLK or posedge RST) begin
        if (RST)
            QN1 <= 1'b0;
        else if (ECLK === 1'bx)
            QN1 <= 1'bx;
        else
            QN1 <= QP0;
    end

    // Output synchronization
    always @(posedge sclk_pol or posedge RST) begin
        if (RST) begin
            QB <= 1'b0;
            QA <= 1'b0;
        end
        else if (sclk_pol === 1'bx) begin
            QB <= 1'bx;
            QA <= 1'bx;
        end
        else if (CE) begin
            QB <= QN0;
            QA <= QN1;
        end
    end

endmodule