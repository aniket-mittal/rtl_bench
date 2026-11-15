module origen_162366(
    input [1:0] Input,
    input [3:0] Present_State,
    output reg [3:0] Next_State
);

always @(*) begin
    case (Present_State)
        4'b1111: begin
            if (Input == 2'b10) begin
                Next_State = 4'b0100;
            end else if (Input == 2'b01) begin
                Next_State = 4'b0000;
            end else begin
                Next_State = 4'b1111;
            end
        end
        4'b0100: begin
            if (Input == 2'b10) begin
                Next_State = 4'b0001;
            end else if (Input == 2'b01) begin
                Next_State = 4'b0101;
            end else begin
                Next_State = 4'b1111;
            end
        end
        4'b0101: begin
            if (Input == 2'b10) begin
                Next_State = 4'b0010;
            end else if (Input == 2'b01) begin
                Next_State = 4'b0110;
            end else begin
                Next_State = 4'b1111;
            end
        end
        4'b0110: begin
            if (Input == 2'b10) begin
                Next_State = 4'b0111;
            end else if (Input == 2'b01) begin
                Next_State = 4'b0011;
            end else begin
                Next_State = 4'b1111;
            end
        end
        4'b0111: begin
            if (Input == 2'b10 || Input == 2'b01) begin
                Next_State = 4'b0111;
            end else begin
                Next_State = 4'b1111;
            end
        end
        4'b0000: begin
            if (Input == 2'b10 || Input == 2'b01) begin
                Next_State = 4'b0001;
            end else begin
                Next_State = 4'b1111;
            end
        end
        4'b0001: begin
            if (Input == 2'b10 || Input == 2'b01) begin
                Next_State = 4'b0010;
            end else begin
                Next_State = 4'b1111;
            end
        end
        4'b0010: begin
            if (Input == 2'b10 || Input == 2'b01) begin
                Next_State = 4'b0011;
            end else begin
                Next_State = 4'b1111;
            end
        end
        4'b0011: begin
            if (Input == 2'b10) begin
                Next_State = 4'b0100;
            end else if (Input == 2'b01) begin
                Next_State = 4'b0000;
            end else begin
                Next_State = 4'b1111;
            end
        end
        default: begin
            Next_State = 4'b1111;
        end
    endcase
end

endmodule