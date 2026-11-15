// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 48;
  localparam OW = 15;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_075380 dut (
    .clk(clk),
    .rst(in_vec[47:47]),
    .loading_loc(in_vec[46:46]),
    .linebegin(in_vec[45:45]),
    .mem_addr_0(in_vec[44:36]),
    .mem_addr_1(in_vec[35:27]),
    .mem_addr_2(in_vec[26:18]),
    .mem_addr_3(in_vec[17:9]),
    .mem_addr_4(in_vec[8:0]),
    .mem_addr_out(out_vec[14:6]),
    .load_en(out_vec[5:1]),
    .img_load_done(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 48'hf2e8e574b1ed;
    stim[1] = 48'ha156aa2fa348;
    stim[2] = 48'h33284e735cf5;
    stim[3] = 48'h670c2d58340c;
    stim[4] = 48'h791e426b3b49;
    stim[5] = 48'hab04b3ea7d84;
    stim[6] = 48'h18bf97bae5f8;
    stim[7] = 48'h153123f35687;
    stim[8] = 48'h2ae03387004c;
    stim[9] = 48'h569328767ab3;
    stim[10] = 48'h4eccbe820380;
    stim[11] = 48'h561dc977ad88;
    stim[12] = 48'h331e4710327e;
    stim[13] = 48'h449167d2e013;
    stim[14] = 48'h7a03041379c6;
    stim[15] = 48'h403f82de1ed7;
    stim[16] = 48'h4df2073473bc;
    stim[17] = 48'h45b2d976746d;
    stim[18] = 48'h1a39e1673aea;
    stim[19] = 48'h46fe463e9a52;
    stim[20] = 48'h6b919a92630a;
    stim[21] = 48'h5c8ae3b9b420;
    stim[22] = 48'h23e96f2a2d61;
    stim[23] = 48'h0220e72243d0;
    stim[24] = 48'h79a896c8e75f;
    stim[25] = 48'h4cd9cf8c0fea;
    stim[26] = 48'h71bb93e5bc84;
    stim[27] = 48'h66f3c202eab9;
    stim[28] = 48'h1f023ff4e512;
    stim[29] = 48'h7ad65346d563;
    stim[30] = 48'h45a5c44705b3;
    stim[31] = 48'h7cf03b3215ac;
    stim[32] = 48'h3b61173a662e;
    stim[33] = 48'h291365ca1f4f;
    stim[34] = 48'h30eaa57f804d;
    stim[35] = 48'h19b2a4837fda;
    stim[36] = 48'h56211771090e;
    stim[37] = 48'h35b970705818;
    stim[38] = 48'h09663ce376a9;
    stim[39] = 48'h23ad2a4ab57b;
    stim[40] = 48'h769a25d62223;
    stim[41] = 48'hdbd1b90ae0b8;
    stim[42] = 48'h18cdabe5410d;
    stim[43] = 48'h7b17656fb82a;
    stim[44] = 48'h08ee4486f15e;
    stim[45] = 48'h6401f4d0e4e9;
    stim[46] = 48'h536419ea74a7;
    stim[47] = 48'h5565107782ff;
    stim[48] = 48'h6156ec323ae6;
    stim[49] = 48'h3d74163c44da;
    stim[50] = 48'h31bfaeb5833a;
    stim[51] = 48'h21f3892c7167;
    stim[52] = 48'h5b0c76c962e5;
    stim[53] = 48'h392d8082e6b3;
    stim[54] = 48'h74ab07c2c03d;
    stim[55] = 48'h2a8017f3946e;
    stim[56] = 48'h2cb7a63e5fde;
    stim[57] = 48'h1e35c241876a;
    stim[58] = 48'h6267077c23cc;
    stim[59] = 48'h1ac49550695c;
    stim[60] = 48'h7c9dd07b1a6d;
    stim[61] = 48'h3f7a654ec2a0;
    stim[62] = 48'h5cdde801cdba;
    stim[63] = 48'h05c37bdefb41;
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
      expv[0] = 15'hxxxx;
      expv[1] = 15'h0000;
      expv[2] = 15'h0540;
      expv[3] = 15'h4c80;
      expv[4] = 15'h1c00;
      expv[5] = 15'h7202;
      expv[6] = 15'h3e84;
      expv[7] = 15'h5c84;
      expv[8] = 15'h54c4;
      expv[9] = 15'h2b84;
      expv[10] = 15'h5a44;
      expv[11] = 15'h65c8;
      expv[12] = 15'h1750;
      expv[13] = 15'h0660;
      expv[14] = 15'h04c0;
      expv[15] = 15'h0002;
      expv[16] = 15'h0005;
      expv[17] = 15'h37c4;
      expv[18] = 15'h16c4;
      expv[19] = 15'h68c4;
      expv[20] = 15'h1bc4;
      expv[21] = 15'h0cc8;
      expv[22] = 15'h3b90;
      expv[23] = 15'h45a0;
      expv[24] = 15'h7400;
      expv[25] = 15'h0002;
      expv[26] = 15'h0005;
      expv[27] = 15'h46c4;
      expv[28] = 15'h1bc4;
      expv[29] = 15'h7c04;
      expv[30] = 15'h6b44;
      expv[31] = 15'h2e08;
      expv[32] = 15'h3310;
      expv[33] = 15'h4ce0;
      expv[34] = 15'h53c0;
      expv[35] = 15'h0002;
      expv[36] = 15'h0005;
      expv[37] = 15'h5884;
      expv[38] = 15'h56c4;
      expv[39] = 15'h2584;
      expv[40] = 15'h6948;
      expv[41] = 15'h5d50;
      expv[42] = 15'h5c20;
      expv[43] = 15'h4360;
      expv[44] = 15'h6c60;
      expv[45] = 15'h7200;
      expv[46] = 15'h4d02;
      expv[47] = 15'h4e84;
      expv[48] = 15'h3fc8;
      expv[49] = 15'h0010;
      expv[50] = 15'h0021;
      expv[51] = 15'h46e0;
      expv[52] = 15'h1c40;
      expv[53] = 15'h6c82;
      expv[54] = 15'h5cc4;
      expv[55] = 15'h0f48;
      expv[56] = 15'h0010;
      expv[57] = 15'h0021;
      expv[58] = 15'h78e0;
      expv[59] = 15'h3800;
      expv[60] = 15'h5502;
      expv[61] = 15'h6344;
      expv[62] = 15'h2808;
      expv[63] = 15'h0010;
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
