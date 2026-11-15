// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 92;
  localparam OW = 71;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_06539 dut (
    .clk(clk),
    .controlbitsfifo_q(in_vec[91:85]),
    .desc_address_fifo_empty(in_vec[84:84]),
    .desc_address_fifo_q(in_vec[83:52]),
    .descriptor_write_waitrequest(in_vec[51:51]),
    .park(in_vec[50:50]),
    .reset_n(in_vec[49:49]),
    .status_token_fifo_data(in_vec[48:25]),
    .status_token_fifo_empty(in_vec[24:24]),
    .status_token_fifo_q(in_vec[23:0]),
    .atlantic_error(out_vec[70:70]),
    .controlbitsfifo_rdreq(out_vec[69:69]),
    .desc_address_fifo_rdreq(out_vec[68:68]),
    .descriptor_write_address(out_vec[67:36]),
    .descriptor_write_busy(out_vec[35:35]),
    .descriptor_write_write(out_vec[34:34]),
    .descriptor_write_writedata(out_vec[33:2]),
    .status_token_fifo_rdreq(out_vec[1:1]),
    .t_eop(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 92'h729566bee8db955e665b785;
    stim[1] = 92'h624911736999eea34f1a1cc;
    stim[2] = 92'hc8fe99891926bfd0802716d;
    stim[3] = 92'hd56233a8142cc4dba6546ec;
    stim[4] = 92'h6de1f7f3452aa1d9d205300;
    stim[5] = 92'h34f4a233f4f55d51af6ae57;
    stim[6] = 92'h52fa0d0185f28d2523389bb;
    stim[7] = 92'hdac19a2f65f3f6a9f06a64d;
    stim[8] = 92'hba9a01d1ad7681a0fdb99f6;
    stim[9] = 92'h9dc62e877c25a2ccbee4afe;
    stim[10] = 92'h0c3f20630ae76468dc007a5;
    stim[11] = 92'h8222b43677ad646ee2a6e9a;
    stim[12] = 92'heb233cd123b28d384e49eb7;
    stim[13] = 92'h5c850d437ca691b93aedab9;
    stim[14] = 92'h23ec8c8816b805741791923;
    stim[15] = 92'h254addce59222b3b9dd0400;
    stim[16] = 92'ha8e0206d493572eced6c522;
    stim[17] = 92'haf14a90e193963bf1715494;
    stim[18] = 92'h896af0122bb46603408176d;
    stim[19] = 92'h0ded2346f7342976552c066;
    stim[20] = 92'hbf27220ecd3342a178a2923;
    stim[21] = 92'hf7745dce4579fb8145e1b25;
    stim[22] = 92'hf5a4aaba0ee14f9727a889b;
    stim[23] = 92'h67b82c04b93ec149b8026c7;
    stim[24] = 92'ha1d3247fb7bc7ef320183cd;
    stim[25] = 92'hb53829e87aedbc59fa3b903;
    stim[26] = 92'h2418441629762bd511792a9;
    stim[27] = 92'hdd35150f5ff3673ae5f7a01;
    stim[28] = 92'h6115dfe35b6b602e0a2d583;
    stim[29] = 92'h7e3005132e23e1f512032a2;
    stim[30] = 92'h5ac292b47864aade6d34244;
    stim[31] = 92'h01e470742bb00aa7571cf7e;
    stim[32] = 92'ha487fbaf7cbed830464da9b;
    stim[33] = 92'h5b1b130efd675a04cb0ae7c;
    stim[34] = 92'h83ab5f926b731bc957f14e8;
    stim[35] = 92'h129829bde96f486d72d1380;
    stim[36] = 92'h2dea043f3cf5a012377c2d0;
    stim[37] = 92'h3d3bfdc655324982728de62;
    stim[38] = 92'h48829f62f4e6115d5e8ec57;
    stim[39] = 92'he0d4ef10967244dd0fbcf99;
    stim[40] = 92'h30a83bc1b62f27f612f5882;
    stim[41] = 92'h9de078453e63cfac9aba515;
    stim[42] = 92'h9bc3895316eefaa297e4978;
    stim[43] = 92'h1e3c426879b911dca2ec53a;
    stim[44] = 92'ha22681ee8ee926109e43bc0;
    stim[45] = 92'h530fc27a3dbc70d4f566172;
    stim[46] = 92'ha7e105fb537c9c7c606857c;
    stim[47] = 92'h2c40d06b89e2b62eb65b771;
    stim[48] = 92'hb11ebf57c821a8fc7dd7047;
    stim[49] = 92'hbaeea6c671b89d1d4dbaf9f;
    stim[50] = 92'he5f132a6aa7e7d6fe663949;
    stim[51] = 92'hc11f013a3e3c44959ffd843;
    stim[52] = 92'hb7375bde8765f1daa8f75b6;
    stim[53] = 92'h8fe3cc75d960af991fc5005;
    stim[54] = 92'hdab8d751bf67088a7e320a0;
    stim[55] = 92'hbc282de34968248884c13ef;
    stim[56] = 92'he5e5ec7d8b3225fe30bf2ae;
    stim[57] = 92'ha74fc0e50da2801b338f589;
    stim[58] = 92'h7a0b5a8c3ef7c5d72eb6435;
    stim[59] = 92'hf800519d992ca1d9066bd86;
    stim[60] = 92'ha31958d1eb29837e2fd42dd;
    stim[61] = 92'h27977b76a2fd14dffa592f6;
    stim[62] = 92'hb3a69e39d17cd17cad9cf8c;
    stim[63] = 92'ha3cf1b766cb20176c6f290c;
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
      expv[0] = 71'h400000000000000001;
      expv[1] = 71'h400000000000000001;
      expv[2] = 71'h400000000000000000;
      expv[3] = 71'h7fe99893519009c5b6;
      expv[4] = 71'h46233a8309a9951bb0;
      expv[5] = 71'h4e1f7f361cd8814c01;
      expv[6] = 71'h4e1f7f361cd8814c01;
      expv[7] = 71'h4e1f7f361cd8814c01;
      expv[8] = 71'h4e1f7f361cd8814c01;
      expv[9] = 71'h49a01d1c93776e67d8;
      expv[10] = 71'h4c62e879813bb92bf8;
      expv[11] = 71'h4c62e879813bb92bf8;
      expv[12] = 71'h4c62e879813bb92bf9;
      expv[13] = 71'h4c62e879813bb92bf8;
      expv[14] = 71'h4c62e879813bb92bf9;
      expv[15] = 71'h4c62e879813bb92bf8;
      expv[16] = 71'h44addce7504b741001;
      expv[17] = 71'h7e0206d651535b148b;
      expv[18] = 71'h414a90e3595dc55251;
      expv[19] = 71'h414a90e3595dc55251;
      expv[20] = 71'h4ed234713c194b0199;
      expv[21] = 71'h427220ee917e28a48d;
      expv[22] = 71'h4745dce613ed786c94;
      expv[23] = 71'h4745dce613ed786c95;
      expv[24] = 71'h4b82c04d50ce009b1d;
      expv[25] = 71'h4b82c04d50ce009b1c;
      expv[26] = 71'h4b82c04d50ce009b1d;
      expv[27] = 71'h4184416452485e4aa5;
      expv[28] = 71'h4184416452485e4aa4;
      expv[29] = 71'h415dfe3772c28b560c;
      expv[30] = 71'h43005134a0fc80ca88;
      expv[31] = 71'h3c292b4942b74d0913;
      expv[32] = 71'h4c292b4942b74d0911;
      expv[33] = 71'h4c292b4942b74d0910;
      expv[34] = 71'h41b130f192b6c2b9f1;
      expv[35] = 71'h4ab5f9287305fc53a0;
      expv[36] = 71'h49829be05224b44e01;
      expv[37] = 71'h49829be05224b44e01;
      expv[38] = 71'h43bfdc671078a37988;
      expv[39] = 71'h43bfdc671078a37989;
      expv[40] = 71'h7d4ef10b23c3ef3e66;
      expv[41] = 71'h4a83bc1d2860bd6208;
      expv[42] = 71'h4e078455af3aae9454;
      expv[43] = 71'h4e078455af3aae9455;
      expv[44] = 71'h4e078455af3aae9454;
      expv[45] = 71'h4e078455af3aae9455;
      expv[46] = 71'h4e078455af3aae9455;
      expv[47] = 71'h4e105fb6f34c1a15f0;
      expv[48] = 71'h4e105fb6f34c1a15f0;
      expv[49] = 71'h41ebf57e416375c11d;
      expv[50] = 71'h41ebf57e416375c11d;
      expv[51] = 71'h4f132a6c63c998e525;
      expv[52] = 71'h41f013a5a183ff610c;
      expv[53] = 71'h4375bdea336e3dd6d8;
      expv[54] = 71'h4e3cc75f531ff14014;
      expv[55] = 71'h4b8d751db3b78c8280;
      expv[56] = 71'h7282de365379304fbf;
      expv[57] = 71'h4e5ec7da79c82fcab8;
      expv[58] = 71'h4e5ec7da79c82fcab9;
      expv[59] = 71'h4e5ec7da79c82fcab8;
      expv[60] = 71'h700519db5df19af61a;
      expv[61] = 71'h41958d207947f50b75;
      expv[62] = 71'h41958d207947f50b75;
      expv[63] = 71'h4a69e39edf67673e31;
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
