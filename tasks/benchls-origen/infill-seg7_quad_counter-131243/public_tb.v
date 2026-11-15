// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 7;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_131243 dut (
    .Cuenta(in_vec[6:0]),
    .catodo1(out_vec[31:24]),
    .catodo2(out_vec[23:16]),
    .catodo3(out_vec[15:8]),
    .catodo4(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 7'h59;
    stim[1] = 7'h5f;
    stim[2] = 7'h6a;
    stim[3] = 7'h4d;
    stim[4] = 7'h49;
    stim[5] = 7'h09;
    stim[6] = 7'h59;
    stim[7] = 7'h1c;
    stim[8] = 7'h46;
    stim[9] = 7'h1f;
    stim[10] = 7'h56;
    stim[11] = 7'h58;
    stim[12] = 7'h21;
    stim[13] = 7'h38;
    stim[14] = 7'h44;
    stim[15] = 7'h22;
    stim[16] = 7'h44;
    stim[17] = 7'h6b;
    stim[18] = 7'h23;
    stim[19] = 7'h74;
    stim[20] = 7'h6a;
    stim[21] = 7'h29;
    stim[22] = 7'h17;
    stim[23] = 7'h70;
    stim[24] = 7'h4e;
    stim[25] = 7'h4c;
    stim[26] = 7'h26;
    stim[27] = 7'h01;
    stim[28] = 7'h61;
    stim[29] = 7'h47;
    stim[30] = 7'h4a;
    stim[31] = 7'h44;
    stim[32] = 7'h4d;
    stim[33] = 7'h2c;
    stim[34] = 7'h53;
    stim[35] = 7'h22;
    stim[36] = 7'h78;
    stim[37] = 7'h14;
    stim[38] = 7'h79;
    stim[39] = 7'h6d;
    stim[40] = 7'h41;
    stim[41] = 7'h61;
    stim[42] = 7'h25;
    stim[43] = 7'h68;
    stim[44] = 7'h6f;
    stim[45] = 7'h70;
    stim[46] = 7'h38;
    stim[47] = 7'h5b;
    stim[48] = 7'h62;
    stim[49] = 7'h39;
    stim[50] = 7'h65;
    stim[51] = 7'h7b;
    stim[52] = 7'h0b;
    stim[53] = 7'h57;
    stim[54] = 7'h7a;
    stim[55] = 7'h78;
    stim[56] = 7'h12;
    stim[57] = 7'h55;
    stim[58] = 7'h4b;
    stim[59] = 7'h3c;
    stim[60] = 7'h2c;
    stim[61] = 7'h0e;
    stim[62] = 7'h23;
    stim[63] = 7'h26;
    for (c = 0; c < N; c = c + 1) begin
      in_vec = stim[c];
      #1 sample;
      #1;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 32'h9080c0c0;
      expv[1] = 32'h9290c0c0;
      expv[2] = 32'h82c0f9c0;
      expv[3] = 32'hf8f8c0c0;
      expv[4] = 32'hb0f8c0c0;
      expv[5] = 32'h90c0c0c0;
      expv[6] = 32'h9080c0c0;
      expv[7] = 32'h80a4c0c0;
      expv[8] = 32'hc0f8c0c0;
      expv[9] = 32'hf9b0c0c0;
      expv[10] = 32'h8280c0c0;
      expv[11] = 32'h8080c0c0;
      expv[12] = 32'hb0b0c0c0;
      expv[13] = 32'h8292c0c0;
      expv[14] = 32'h8082c0c0;
      expv[15] = 32'h99b0c0c0;
      expv[16] = 32'h8082c0c0;
      expv[17] = 32'hf8c0f9c0;
      expv[18] = 32'h92b0c0c0;
      expv[19] = 32'h82f9f9c0;
      expv[20] = 32'h82c0f9c0;
      expv[21] = 32'hf999c0c0;
      expv[22] = 32'hb0a4c0c0;
      expv[23] = 32'ha4f9f9c0;
      expv[24] = 32'h80f8c0c0;
      expv[25] = 32'h82f8c0c0;
      expv[26] = 32'h80b0c0c0;
      expv[27] = 32'hf9c0c0c0;
      expv[28] = 32'hf890c0c0;
      expv[29] = 32'hf9f8c0c0;
      expv[30] = 32'h99f8c0c0;
      expv[31] = 32'h8082c0c0;
      expv[32] = 32'hf8f8c0c0;
      expv[33] = 32'h9999c0c0;
      expv[34] = 32'hb080c0c0;
      expv[35] = 32'h99b0c0c0;
      expv[36] = 32'hc0a4f9c0;
      expv[37] = 32'hc0a4c0c0;
      expv[38] = 32'hf9a4f9c0;
      expv[39] = 32'h90c0f9c0;
      expv[40] = 32'h9282c0c0;
      expv[41] = 32'hf890c0c0;
      expv[42] = 32'hf8b0c0c0;
      expv[43] = 32'h99c0f9c0;
      expv[44] = 32'hf9f9f9c0;
      expv[45] = 32'ha4f9f9c0;
      expv[46] = 32'h8292c0c0;
      expv[47] = 32'hf990c0c0;
      expv[48] = 32'h8090c0c0;
      expv[49] = 32'hf892c0c0;
      expv[50] = 32'hf9c0f9c0;
      expv[51] = 32'hb0a4f9c0;
      expv[52] = 32'hf9f9c0c0;
      expv[53] = 32'hf880c0c0;
      expv[54] = 32'ha4a4f9c0;
      expv[55] = 32'hc0a4f9c0;
      expv[56] = 32'h80f9c0c0;
      expv[57] = 32'h9280c0c0;
      expv[58] = 32'h92f8c0c0;
      expv[59] = 32'hc082c0c0;
      expv[60] = 32'h9999c0c0;
      expv[61] = 32'h99f9c0c0;
      expv[62] = 32'h92b0c0c0;
      expv[63] = 32'h80b0c0c0;
      mismatches = 0;
      shown = 0;
      for (c = 0; c < N; c = c + 1) begin
        bad = 0;
        for (b = 0; b < OW; b = b + 1)
          if (expv[c][b] !== 1'bx && act[c][b] !== expv[c][b]) bad = 1;
        if (bad) begin
          mismatches = mismatches + 1;
          if (shown < 10) begin
            $display("MISMATCH cycle %0d: inputs=%h expected=%h got=%h", c, stim[c], expv[c], act[c]);
            shown = shown + 1;
          end
        end
      end
      if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
      else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    end
    $finish;
  end
endmodule
