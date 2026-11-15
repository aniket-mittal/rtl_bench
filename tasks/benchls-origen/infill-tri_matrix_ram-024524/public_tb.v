// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 43;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_024524 dut (
    .in_clk(clk),
    .in_address(in_vec[42:39]),
    .in_data(in_vec[38:7]),
    .in_type(in_vec[6:5]),
    .in_select_matrix(in_vec[4:3]),
    .in_reset(in_vec[2:2]),
    .in_read_en(in_vec[1:1]),
    .in_write_en(in_vec[0:0]),
    .out_data(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 43'h728b03da3be;
    stim[1] = 43'h5f4a54232a6;
    stim[2] = 43'h49bab6c5cd3;
    stim[3] = 43'h49f23165aea;
    stim[4] = 43'h4d5dd71e0a7;
    stim[5] = 43'h44cdcc078a8;
    stim[6] = 43'h722520ba4c3;
    stim[7] = 43'h3548cd53683;
    stim[8] = 43'h6b1abf17960;
    stim[9] = 43'h7ebedcd2c61;
    stim[10] = 43'h5845f2346fb;
    stim[11] = 43'h171693ffad3;
    stim[12] = 43'h566da2fc143;
    stim[13] = 43'h6e2704b3908;
    stim[14] = 43'h068b4d1c043;
    stim[15] = 43'h0b203ec96d2;
    stim[16] = 43'h622116dbd21;
    stim[17] = 43'h74c116e515b;
    stim[18] = 43'h4bd657409bb;
    stim[19] = 43'h0d462770b92;
    stim[20] = 43'h10dd5f0dd10;
    stim[21] = 43'h505eaf15cea;
    stim[22] = 43'h40ec0a89090;
    stim[23] = 43'h134d4f22648;
    stim[24] = 43'h35a21755f8a;
    stim[25] = 43'h3ca6c93cc80;
    stim[26] = 43'h1f0936e46c8;
    stim[27] = 43'h40e89021eaa;
    stim[28] = 43'h5c5ed1f9d1a;
    stim[29] = 43'h3a910985192;
    stim[30] = 43'h10329eeb7c9;
    stim[31] = 43'h04edde66d52;
    stim[32] = 43'h526f64172c7;
    stim[33] = 43'h549c0ebf733;
    stim[34] = 43'h4f3c138bb21;
    stim[35] = 43'h0bb888b97a2;
    stim[36] = 43'h4a4b25e7080;
    stim[37] = 43'h1244a76a762;
    stim[38] = 43'h7995a33bd2a;
    stim[39] = 43'h58886c4d941;
    stim[40] = 43'h26d29aac950;
    stim[41] = 43'h5c4950ef7a2;
    stim[42] = 43'h6869201db92;
    stim[43] = 43'h23ac002c08b;
    stim[44] = 43'h6579677fdd2;
    stim[45] = 43'h39226d03470;
    stim[46] = 43'h47e25630db9;
    stim[47] = 43'h4d40e3dfda2;
    stim[48] = 43'h314966218d8;
    stim[49] = 43'h077f7245fdb;
    stim[50] = 43'h43edaba37d2;
    stim[51] = 43'h317a436b600;
    stim[52] = 43'h243535258b2;
    stim[53] = 43'h61c2a685950;
    stim[54] = 43'h62df3d56879;
    stim[55] = 43'h3e13379acb1;
    stim[56] = 43'h60dea950e50;
    stim[57] = 43'h7444967f439;
    stim[58] = 43'h39317f8896a;
    stim[59] = 43'h1f49202a05b;
    stim[60] = 43'h74402904d6a;
    stim[61] = 43'h6114aaebf98;
    stim[62] = 43'h1fd68c2527b;
    stim[63] = 43'h08bc9c31a3a;
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
      expv[0] = 32'hxxxxxxxx;
      expv[1] = 32'h00000000;
      expv[2] = 32'h00000000;
      expv[3] = 32'hxxxxxxxx;
      expv[4] = 32'h00000000;
      expv[5] = 32'hxxxxxxxx;
      expv[6] = 32'h00000000;
      expv[7] = 32'h00000000;
      expv[8] = 32'hxxxxxxxx;
      expv[9] = 32'hxxxxxxxx;
      expv[10] = 32'hxxxxxxxx;
      expv[11] = 32'h00000000;
      expv[12] = 32'h00000000;
      expv[13] = 32'hxxxxxxxx;
      expv[14] = 32'h00000000;
      expv[15] = 32'h00000000;
      expv[16] = 32'hxxxxxxxx;
      expv[17] = 32'hxxxxxxxx;
      expv[18] = 32'hxxxxxxxx;
      expv[19] = 32'h00000000;
      expv[20] = 32'hxxxxxxxx;
      expv[21] = 32'hxxxxxxxx;
      expv[22] = 32'hxxxxxxxx;
      expv[23] = 32'hxxxxxxxx;
      expv[24] = 32'h00000000;
      expv[25] = 32'hxxxxxxxx;
      expv[26] = 32'hxxxxxxxx;
      expv[27] = 32'h00000000;
      expv[28] = 32'hxxxxxxxx;
      expv[29] = 32'h00000000;
      expv[30] = 32'hxxxxxxxx;
      expv[31] = 32'h00000000;
      expv[32] = 32'h00000000;
      expv[33] = 32'h00000000;
      expv[34] = 32'hxxxxxxxx;
      expv[35] = 32'h00000000;
      expv[36] = 32'hxxxxxxxx;
      expv[37] = 32'hxxxxxxxx;
      expv[38] = 32'h00000000;
      expv[39] = 32'hxxxxxxxx;
      expv[40] = 32'hxxxxxxxx;
      expv[41] = 32'h00000000;
      expv[42] = 32'h00000000;
      expv[43] = 32'h00000000;
      expv[44] = 32'h00000000;
      expv[45] = 32'hxxxxxxxx;
      expv[46] = 32'hxxxxxxxx;
      expv[47] = 32'h00000000;
      expv[48] = 32'hxxxxxxxx;
      expv[49] = 32'hxxxxxxxx;
      expv[50] = 32'h00000000;
      expv[51] = 32'hxxxxxxxx;
      expv[52] = 32'h00000000;
      expv[53] = 32'hxxxxxxxx;
      expv[54] = 32'hxxxxxxxx;
      expv[55] = 32'hxxxxxxxx;
      expv[56] = 32'hxxxxxxxx;
      expv[57] = 32'hxxxxxxxx;
      expv[58] = 32'hxxxxxxxx;
      expv[59] = 32'hxxxxxxxx;
      expv[60] = 32'hxxxxxxxx;
      expv[61] = 32'hxxxxxxxx;
      expv[62] = 32'hxxxxxxxx;
      expv[63] = 32'hxxxxxxxx;
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
