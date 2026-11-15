module origen_097299 (
    input wire clk,
    input wire rst,
    input wire IN,
    output reg Led,
    output wire [1:0] Estado
);

    // State encoding
    localparam APAGADO = 1'b0;
    localparam ENCENDIDO = 1'b1;

    // State register
    reg current_state, next_state;

    // State register process
    always @(posedge clk or posedge rst) begin
        if (rst)
            current_state <= APAGADO;
        else
            current_state <= next_state;
    end

    // Next state logic and output logic process
    always @(*) begin
        case (current_state)
            APAGADO: begin
                if (IN) begin
                    next_state = ENCENDIDO;
                    Led = 1'b0;
                end else begin
                    next_state = APAGADO;
                    Led = 1'b1;
                end
            end
            ENCENDIDO: begin
                if (IN) begin
                    next_state = ENCENDIDO;
                    Led = 1'b0;
                end else begin
                    next_state = APAGADO;
                    Led = 1'b1;
                end
            end
            default: begin
                next_state = APAGADO;
                Led = 1'bz;
            end
        endcase
    end

    // Assign current state to Estado output
    assign Estado = {1'b0, current_state};

endmodule