// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 31;
  localparam OW = 36;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_07569 dut (
    .clk(clk),
    .rstn(in_vec[30:30]),
    .tic_enable(in_vec[29:29]),
    .f_control(in_vec[28:0]),
    .carrier_val(out_vec[35:4]),
    .i_sign(out_vec[3:3]),
    .i_mag(out_vec[2:2]),
    .q_sign(out_vec[1:1]),
    .q_mag(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 31'h1388cbba;
    stim[1] = 31'h12a6a9d7;
    stim[2] = 31'h50f08174;
    stim[3] = 31'h616cad53;
    stim[4] = 31'h79b1c41d;
    stim[5] = 31'h6dd01024;
    stim[6] = 31'h475be3ec;
    stim[7] = 31'h6171812d;
    stim[8] = 31'h259c49e6;
    stim[9] = 31'h7069d665;
    stim[10] = 31'h7fd80a2e;
    stim[11] = 31'h40edc9b0;
    stim[12] = 31'h58c48a7d;
    stim[13] = 31'h550f5eb2;
    stim[14] = 31'h72e4c939;
    stim[15] = 31'h6e48bc24;
    stim[16] = 31'h69ec5006;
    stim[17] = 31'h76b30621;
    stim[18] = 31'h466c956e;
    stim[19] = 31'h4154d413;
    stim[20] = 31'h67bbce44;
    stim[21] = 31'h663ec1eb;
    stim[22] = 31'h49775073;
    stim[23] = 31'h4f34f918;
    stim[24] = 31'h70e5dafb;
    stim[25] = 31'h44175fa4;
    stim[26] = 31'h502193a9;
    stim[27] = 31'h5526eb84;
    stim[28] = 31'h66014a62;
    stim[29] = 31'h5e337e8f;
    stim[30] = 31'h566daa98;
    stim[31] = 31'h62b5b9ff;
    stim[32] = 31'h62a81fb9;
    stim[33] = 31'h711bc760;
    stim[34] = 31'h69e74a15;
    stim[35] = 31'h62df30bc;
    stim[36] = 31'h78cccbbb;
    stim[37] = 31'h32be62e2;
    stim[38] = 31'h74f3d183;
    stim[39] = 31'h774fbfa7;
    stim[40] = 31'h53a6f884;
    stim[41] = 31'h744588e6;
    stim[42] = 31'h6dd2b274;
    stim[43] = 31'h6eda52d4;
    stim[44] = 31'h60c32d90;
    stim[45] = 31'h58c0c621;
    stim[46] = 31'h7aff1305;
    stim[47] = 31'h7cf6915b;
    stim[48] = 31'h727e4660;
    stim[49] = 31'h5d8e11e0;
    stim[50] = 31'h66a8d958;
    stim[51] = 31'h7acf9c50;
    stim[52] = 31'h42807a0e;
    stim[53] = 31'h50f15e22;
    stim[54] = 31'h7de18af5;
    stim[55] = 31'h5177852d;
    stim[56] = 31'h4507fba6;
    stim[57] = 31'h7362b0c4;
    stim[58] = 31'h4a939bdf;
    stim[59] = 31'h52a1461c;
    stim[60] = 31'h6c56c392;
    stim[61] = 31'h0805e3dd;
    stim[62] = 31'h7c9c8a45;
    stim[63] = 31'h59d480a3;
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
      expv[0] = 36'hxxxxxxxxe;
      expv[1] = 36'hxxxxxxxxe;
      expv[2] = 36'hxxxxxxxxe;
      expv[3] = 36'hxxxxxxxxe;
      expv[4] = 36'h0000010f4;
      expv[5] = 36'h000001256;
      expv[6] = 36'h000002c03;
      expv[7] = 36'h000002c03;
      expv[8] = 36'h00000413b;
      expv[9] = 36'h00000413e;
      expv[10] = 36'h000000004;
      expv[11] = 36'h000001064;
      expv[12] = 36'h00000106b;
      expv[13] = 36'h000001069;
      expv[14] = 36'h000001064;
      expv[15] = 36'h000005f03;
      expv[16] = 36'h0000031eb;
      expv[17] = 36'h000000039;
      expv[18] = 36'h000000a11;
      expv[19] = 36'h000000a11;
      expv[20] = 36'h000000a14;
      expv[21] = 36'h000002896;
      expv[22] = 36'h000003043;
      expv[23] = 36'h00000304e;
      expv[24] = 36'h000003049;
      expv[25] = 36'h000004f31;
      expv[26] = 36'h000004f36;
      expv[27] = 36'h000004f3b;
      expv[28] = 36'h000004f3e;
      expv[29] = 36'h000004974;
      expv[30] = 36'h00000497b;
      expv[31] = 36'h00000497b;
      expv[32] = 36'h00000442b;
      expv[33] = 36'h0000006dc;
      expv[34] = 36'h000000971;
      expv[35] = 36'h000001a91;
      expv[36] = 36'h000002483;
      expv[37] = 36'h00000276e;
      expv[38] = 36'h00000276c;
      expv[39] = 36'h000000004;
      expv[40] = 36'h0000014f3;
      expv[41] = 36'h0000014fc;
      expv[42] = 36'h000003fe9;
      expv[43] = 36'h000001434;
      expv[44] = 36'h000002204;
      expv[45] = 36'h0000030db;
      expv[46] = 36'h0000030d1;
      expv[47] = 36'h000004a63;
      expv[48] = 36'h00000256c;
      expv[49] = 36'h000000254;
      expv[50] = 36'h000000256;
      expv[51] = 36'h00000326e;
      expv[52] = 36'h00000390c;
      expv[53] = 36'h000003901;
      expv[54] = 36'h00000390b;
      expv[55] = 36'h00000274c;
      expv[56] = 36'h00000274c;
      expv[57] = 36'h000002744;
      expv[58] = 36'h000001ba6;
      expv[59] = 36'h000001bae;
      expv[60] = 36'h000001bac;
      expv[61] = 36'h000004c4b;
      expv[62] = 36'h000004c49;
      expv[63] = 36'h000000006;
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
