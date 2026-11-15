module origen_048605 (
    input wire clk,
    input wire clr,
    input wire go,
    input wire halt,
    output reg we,
    output reg [17:0] sram_addr,
    output reg [2:0] pattern,
    output reg en
);

    // State encoding
    localparam START = 3'b000;
    localparam ADDROUT = 3'b001;
    localparam DATAOUT = 3'b010;
    localparam WRITE = 3'b011;
    localparam TEST1 = 3'b100;
    localparam WAIT_AND_GO = 3'b101;
    localparam READ = 3'b110;
    localparam TEST2 = 3'b111;
    localparam HALT = 3'b100;

    reg [2:0] state, next_state;
    reg [17:0] addrv;
    reg [2:0] patternv;

    // State register
    always @(posedge clk or posedge clr) begin
        if (clr) state <= START;
        else state <= next_state;
    end

    // Next state logic and output logic
    always @(*) begin
        next_state = state;
        we = 1'b1;
        en = 1'b0;
        sram_addr = addrv;
        pattern = patternv;

        case (state)
            START: begin
                if (go) next_state = ADDROUT;
            end
            ADDROUT: begin
                en = 1'b1;
                next_state = DATAOUT;
            end
            DATAOUT: begin
                en = 1'b1;
                next_state = WRITE;
            end
            WRITE: begin
                en = 1'b1;
                we = 1'b0;
                next_state = TEST1;
            end
            TEST1: begin
                en = 1'b1;
                if (halt) next_state = HALT;
                else if (addrv == 18'h3FFFF) next_state = WAIT_AND_GO;
                else next_state = ADDROUT;
            end
            WAIT_AND_GO: begin
                en = 1'b1;
                if (!go) next_state = READ;
            end
            READ: begin
                en = 1'b1;
                if (go) next_state = TEST2;
            end
            TEST2: begin
                en = 1'b1;
                if (addrv == 18'h3FFFF) begin
                    if (patternv == 3'b111) next_state = START;
                    else next_state = ADDROUT;
                end else begin
                    next_state = WAIT_AND_GO;
                end
            end
            HALT: begin
                // Stay in HALT state
            end
        endcase
    end

    // Address and pattern update logic
    always @(posedge clk or posedge clr) begin
        if (clr) begin
            addrv <= 18'b0;
            patternv <= 3'b0;
        end else begin
            case (state)
                START: begin
                    addrv <= 18'b0;
                    patternv <= 3'b0;
                end
                TEST1: begin
                    if (addrv == 18'h3FFFF) addrv <= 18'b0;
                    else addrv <= addrv + 1'b1;
                end
                TEST2: begin
                    if (addrv == 18'h3FFFF) begin
                        addrv <= 18'b0;
                        if (patternv == 3'b111) patternv <= 3'b0;
                        else patternv <= patternv + 1'b1;
                    end else begin
                        addrv <= addrv + 1'b1;
                    end
                end
            endcase
        end
    end

endmodule