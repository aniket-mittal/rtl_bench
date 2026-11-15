module origen_031012 (
    input wire clk,
    input wire reset,
    input wire [19:0] read_data,
    output reg [19:0] i,
    output reg [19:0] j,
    output reg read,
    output reg write,
    output reg index,
    output reg finish,
    output reg [39:0] write_data
);

    // State encoding
    localparam IDLE = 3'd0,
               READROWCOL = 3'd1,
               READM1 = 3'd2,
               READM2 = 3'd3,
               WRITE = 3'd4;

    reg [2:0] state, next_state;
    reg [19:0] row1, col1row2, col2;
    reg [19:0] k;
    reg [39:0] total;
    reg [19:0] m1 [0:99];
    reg [19:0] m2 [0:99];

    // Combinational logic for next state and output
    always @(*) begin
        next_state = state;
        read = 1'b1;
        write = 1'b1;
        index = 1'b0;
        finish = 1'b0;

        case (state)
            IDLE: begin
                if (!reset) next_state = READROWCOL;
            end
            READROWCOL: begin
                if (j == 2) next_state = READM1;
            end
            READM1: begin
                read = 1'b1;
                write = 1'b0;
                if (i == row1 - 1 && j == col1row2 - 1) next_state = READM2;
            end
            READM2: begin
                read = 1'b1;
                write = 1'b0;
                index = 1'b1;
                if (i == col1row2 - 1 && j == col2 - 1) next_state = WRITE;
            end
            WRITE: begin
                if (i == row1 - 1 && j == col2 - 1) begin
                    finish = 1'b1;
                    next_state = IDLE;
                end
                else if (j == col2 - 1) next_state = READM1;
            end
        endcase
    end

    // Sequential logic for state transitions and calculations
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            state <= IDLE;
            i <= 0;
            j <= 0;
            k <= 0;
            total <= 0;
        end else begin
            state <= next_state;
            case (state)
                IDLE: begin
                    i <= 0;
                    j <= 0;
                    k <= 0;
                    total <= 0;
                end
                READROWCOL: begin
                    case (j)
                        0: row1 <= read_data;
                        1: col1row2 <= read_data;
                        2: col2 <= read_data;
                    endcase
                    j <= j + 1;
                end
                READM1: begin
                    m1[i * col1row2 + j] <= read_data;
                    if (j == col1row2 - 1) begin
                        i <= i + 1;
                        j <= 0;
                    end else begin
                        j <= j + 1;
                    end
                end
                READM2: begin
                    m2[i * col2 + j] <= read_data;
                    if (j == col2 - 1) begin
                        i <= i + 1;
                        j <= 0;
                    end else begin
                        j <= j + 1;
                    end
                end
                WRITE: begin
                    if (k == 0) begin
                        total <= 0;
                    end
                    total <= total + m1[i * col1row2 + k] * m2[k * col2 + j];
                    if (k == col1row2 - 1) begin
                        write_data <= total;
                        k <= 0;
                        if (j == col2 - 1) begin
                            i <= i + 1;
                            j <= 0;
                        end else begin
                            j <= j + 1;
                        end
                    end else begin
                        k <= k + 1;
                    end
                end
            endcase
        end
    end

endmodule