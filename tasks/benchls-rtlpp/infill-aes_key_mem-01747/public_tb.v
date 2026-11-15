// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 22;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_01747 dut (
    .clk(clk),
    .reset_n(in_vec[21:21]),
    .init(in_vec[20:20]),
    .key_write_addr(in_vec[19:15]),
    .key_write_data(in_vec[14:7]),
    .key_write(in_vec[6:6]),
    .key_size(in_vec[5:5]),
    .key_read_addr(in_vec[4:0]),
    .key_read_data(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 22'h08b2a5;
    stim[1] = 22'h162b7b;
    stim[2] = 22'h2e1ade;
    stim[3] = 22'h2baaac;
    stim[4] = 22'h3e324f;
    stim[5] = 22'h33d851;
    stim[6] = 22'h224fbe;
    stim[7] = 22'h31b907;
    stim[8] = 22'h344545;
    stim[9] = 22'h327161;
    stim[10] = 22'h3e6db5;
    stim[11] = 22'h0cabe2;
    stim[12] = 22'h33d8bc;
    stim[13] = 22'h2b7ef2;
    stim[14] = 22'h28c4e7;
    stim[15] = 22'h26c8e1;
    stim[16] = 22'h33b71e;
    stim[17] = 22'h20bd75;
    stim[18] = 22'h307e89;
    stim[19] = 22'h281e94;
    stim[20] = 22'h31efb7;
    stim[21] = 22'h34da6a;
    stim[22] = 22'h21e3f8;
    stim[23] = 22'h26f2ad;
    stim[24] = 22'h23e301;
    stim[25] = 22'h230b70;
    stim[26] = 22'h22a292;
    stim[27] = 22'h30b945;
    stim[28] = 22'h231767;
    stim[29] = 22'h347aae;
    stim[30] = 22'h3b7595;
    stim[31] = 22'h38a31b;
    stim[32] = 22'h260a46;
    stim[33] = 22'h2f1e0f;
    stim[34] = 22'h3981ad;
    stim[35] = 22'h3adbf9;
    stim[36] = 22'h225c67;
    stim[37] = 22'h271dcb;
    stim[38] = 22'h2731af;
    stim[39] = 22'h2abf34;
    stim[40] = 22'h22ee9e;
    stim[41] = 22'h3733bd;
    stim[42] = 22'h32b68d;
    stim[43] = 22'h35bff4;
    stim[44] = 22'h36f8bf;
    stim[45] = 22'h26b686;
    stim[46] = 22'h2525b3;
    stim[47] = 22'h2adf8b;
    stim[48] = 22'h3c0029;
    stim[49] = 22'h23356c;
    stim[50] = 22'h28b944;
    stim[51] = 22'h34aa9e;
    stim[52] = 22'h3e01ca;
    stim[53] = 22'h34db6c;
    stim[54] = 22'h34dae7;
    stim[55] = 22'h3aff45;
    stim[56] = 22'h2345b8;
    stim[57] = 22'h2ecd5d;
    stim[58] = 22'h2583a1;
    stim[59] = 22'h28ca7c;
    stim[60] = 22'h3a44ff;
    stim[61] = 22'h2c5a03;
    stim[62] = 22'h2e5ac3;
    stim[63] = 22'h31bb7f;
    for (c = 0; c < N; c = c + 1) begin
      #1 in_vec = stim[c];
      #3 sample;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 8'h00;
      expv[1] = 8'h00;
      expv[2] = 8'h00;
      expv[3] = 8'h00;
      expv[4] = 8'h00;
      expv[5] = 8'h00;
      expv[6] = 8'h00;
      expv[7] = 8'hb0;
      expv[8] = 8'h00;
      expv[9] = 8'h00;
      expv[10] = 8'h00;
      expv[11] = 8'h00;
      expv[12] = 8'h00;
      expv[13] = 8'h00;
      expv[14] = 8'h00;
      expv[15] = 8'h00;
      expv[16] = 8'h00;
      expv[17] = 8'h00;
      expv[18] = 8'h00;
      expv[19] = 8'h00;
      expv[20] = 8'h00;
      expv[21] = 8'h00;
      expv[22] = 8'h00;
      expv[23] = 8'h91;
      expv[24] = 8'h7a;
      expv[25] = 8'h00;
      expv[26] = 8'h00;
      expv[27] = 8'h00;
      expv[28] = 8'h00;
      expv[29] = 8'h00;
      expv[30] = 8'h00;
      expv[31] = 8'h00;
      expv[32] = 8'h2e;
      expv[33] = 8'h00;
      expv[34] = 8'h91;
      expv[35] = 8'h00;
      expv[36] = 8'h00;
      expv[37] = 8'h00;
      expv[38] = 8'h00;
      expv[39] = 8'h00;
      expv[40] = 8'h00;
      expv[41] = 8'h00;
      expv[42] = 8'h91;
      expv[43] = 8'hb8;
      expv[44] = 8'h00;
      expv[45] = 8'h2e;
      expv[46] = 8'h00;
      expv[47] = 8'h7f;
      expv[48] = 8'hb4;
      expv[49] = 8'h14;
      expv[50] = 8'hb8;
      expv[51] = 8'h00;
      expv[52] = 8'h00;
      expv[53] = 8'h14;
      expv[54] = 8'h00;
      expv[55] = 8'h00;
      expv[56] = 8'h00;
      expv[57] = 8'h91;
      expv[58] = 8'h72;
      expv[59] = 8'h14;
      expv[60] = 8'h00;
      expv[61] = 8'hc7;
      expv[62] = 8'hc7;
      expv[63] = 8'h00;
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
