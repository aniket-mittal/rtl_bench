// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 38;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_10968 dut (
    .clk(clk),
    .address(in_vec[37:36]),
    .chipselect(in_vec[35:35]),
    .in_port(in_vec[34:34]),
    .reset_n(in_vec[33:33]),
    .write_n(in_vec[32:32]),
    .writedata(in_vec[31:0]),
    .irq(out_vec[32:32]),
    .readdata(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 38'h11f2b9ff69;
    stim[1] = 38'h0174e7e08a;
    stim[2] = 38'h22af3981c6;
    stim[3] = 38'h2e4d42b1d0;
    stim[4] = 38'h1ef8c54e59;
    stim[5] = 38'h3ba2dfddc7;
    stim[6] = 38'h367bb19b44;
    stim[7] = 38'h3bc6176098;
    stim[8] = 38'h0640ed8434;
    stim[9] = 38'h126994d0af;
    stim[10] = 38'h2e3aa1caad;
    stim[11] = 38'h2ed96c90a0;
    stim[12] = 38'h1e45da21e8;
    stim[13] = 38'h1364be1f22;
    stim[14] = 38'h3b041826e4;
    stim[15] = 38'h36ee6c960b;
    stim[16] = 38'h23bd003dc8;
    stim[17] = 38'h3e4741e76a;
    stim[18] = 38'h0adbe53e37;
    stim[19] = 38'h1741ae3b76;
    stim[20] = 38'h1e0289d0f7;
    stim[21] = 38'h27d643fe07;
    stim[22] = 38'h0f2bcd5489;
    stim[23] = 38'h1613a9b874;
    stim[24] = 38'h3f647598df;
    stim[25] = 38'h291fec9aeb;
    stim[26] = 38'h170ae1be34;
    stim[27] = 38'h167c1a3347;
    stim[28] = 38'h23793aa122;
    stim[29] = 38'h13519ef15c;
    stim[30] = 38'h1a20bd7c8f;
    stim[31] = 38'h032fbdf374;
    stim[32] = 38'h2ab328d9db;
    stim[33] = 38'h1be882aa6a;
    stim[34] = 38'h0fb52a443a;
    stim[35] = 38'h1ea53cd343;
    stim[36] = 38'h0af0bbe6ae;
    stim[37] = 38'h0a6b36839b;
    stim[38] = 38'h0206043b2c;
    stim[39] = 38'h1b16d7d3fc;
    stim[40] = 38'h2ba1b71554;
    stim[41] = 38'h1fee4b5d28;
    stim[42] = 38'h0fc51c400e;
    stim[43] = 38'h1ee61d9263;
    stim[44] = 38'h0fdb33d14a;
    stim[45] = 38'h2ee596c1b8;
    stim[46] = 38'h2719c933b0;
    stim[47] = 38'h2aff85c724;
    stim[48] = 38'h266503cc64;
    stim[49] = 38'h3daeeb6b63;
    stim[50] = 38'h13026f3d1a;
    stim[51] = 38'h32f8091164;
    stim[52] = 38'h2f4a6f4c09;
    stim[53] = 38'h2ef2478778;
    stim[54] = 38'h3b17e4945a;
    stim[55] = 38'h3e170adcd1;
    stim[56] = 38'h1736498def;
    stim[57] = 38'h37a412e026;
    stim[58] = 38'h3733f18c94;
    stim[59] = 38'h120751d6b4;
    stim[60] = 38'h0b7f6064be;
    stim[61] = 38'h3a5e3c70c9;
    stim[62] = 38'h0fa3366f99;
    stim[63] = 38'h32f94fe432;
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
      expv[0] = 33'h000000000;
      expv[1] = 33'h000000000;
      expv[2] = 33'h000000000;
      expv[3] = 33'h000000000;
      expv[4] = 33'h000000000;
      expv[5] = 33'h000000000;
      expv[6] = 33'h000000001;
      expv[7] = 33'h000000001;
      expv[8] = 33'h000000001;
      expv[9] = 33'h000000001;
      expv[10] = 33'h000000000;
      expv[11] = 33'h100000000;
      expv[12] = 33'h000000001;
      expv[13] = 33'h000000000;
      expv[14] = 33'h000000000;
      expv[15] = 33'h000000001;
      expv[16] = 33'h000000001;
      expv[17] = 33'h000000000;
      expv[18] = 33'h000000001;
      expv[19] = 33'h000000000;
      expv[20] = 33'h000000000;
      expv[21] = 33'h000000000;
      expv[22] = 33'h000000000;
      expv[23] = 33'h000000001;
      expv[24] = 33'h000000000;
      expv[25] = 33'h000000000;
      expv[26] = 33'h000000000;
      expv[27] = 33'h000000000;
      expv[28] = 33'h000000000;
      expv[29] = 33'h000000000;
      expv[30] = 33'h000000000;
      expv[31] = 33'h000000000;
      expv[32] = 33'h000000000;
      expv[33] = 33'h100000000;
      expv[34] = 33'h100000000;
      expv[35] = 33'h100000001;
      expv[36] = 33'h100000000;
      expv[37] = 33'h100000000;
      expv[38] = 33'h100000000;
      expv[39] = 33'h100000000;
      expv[40] = 33'h100000000;
      expv[41] = 33'h100000001;
      expv[42] = 33'h100000000;
      expv[43] = 33'h100000001;
      expv[44] = 33'h100000000;
      expv[45] = 33'h100000001;
      expv[46] = 33'h000000001;
      expv[47] = 33'h000000000;
      expv[48] = 33'h000000000;
      expv[49] = 33'h000000000;
      expv[50] = 33'h000000000;
      expv[51] = 33'h000000000;
      expv[52] = 33'h000000000;
      expv[53] = 33'h000000000;
      expv[54] = 33'h000000000;
      expv[55] = 33'h000000001;
      expv[56] = 33'h000000001;
      expv[57] = 33'h000000000;
      expv[58] = 33'h000000001;
      expv[59] = 33'h000000001;
      expv[60] = 33'h000000000;
      expv[61] = 33'h000000000;
      expv[62] = 33'h000000001;
      expv[63] = 33'h000000001;
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
