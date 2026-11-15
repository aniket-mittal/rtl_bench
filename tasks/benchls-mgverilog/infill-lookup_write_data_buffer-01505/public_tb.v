// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 33;
  localparam OW = 66;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_01505 dut (
    .dirrep_dir_wr_par_c4(in_vec[32:32]),
    .dir_vld_c4_l(in_vec[31:31]),
    .lkup_addr8_c4(in_vec[30:30]),
    .tagdp_lkup_addr_c4(in_vec[29:0]),
    .lkup_wr_data_up_buf(out_vec[65:33]),
    .lkup_wr_data_dn_buf(out_vec[32:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 33'h1a5c7ea92;
    stim[1] = 33'h101fcc23a;
    stim[2] = 33'h0ff89036c;
    stim[3] = 33'h1ce4abb4d;
    stim[4] = 33'h0b2147a24;
    stim[5] = 33'h0b3863785;
    stim[6] = 33'h0860994dc;
    stim[7] = 33'h1ca3f6a97;
    stim[8] = 33'h1e0cf00ed;
    stim[9] = 33'h14ae471dc;
    stim[10] = 33'h1871d94cf;
    stim[11] = 33'h1f8d0585a;
    stim[12] = 33'h1122e5f74;
    stim[13] = 33'h1265d71a8;
    stim[14] = 33'h0ac345416;
    stim[15] = 33'h12bf7ab29;
    stim[16] = 33'h0f346235e;
    stim[17] = 33'h07b267ab3;
    stim[18] = 33'h124d2d903;
    stim[19] = 33'h0b01e7e1b;
    stim[20] = 33'h0140b1de3;
    stim[21] = 33'h06794d51b;
    stim[22] = 33'h1866dbcb6;
    stim[23] = 33'h1d199b6c8;
    stim[24] = 33'h022e1822e;
    stim[25] = 33'h13f9b5052;
    stim[26] = 33'h0b6cddd70;
    stim[27] = 33'h01a21e13c;
    stim[28] = 33'h1536c8e13;
    stim[29] = 33'h1cec07ca6;
    stim[30] = 33'h0f87ee263;
    stim[31] = 33'h0d5b05fe0;
    stim[32] = 33'h1bf00bfc9;
    stim[33] = 33'h1bc45e9d1;
    stim[34] = 33'h146a97c69;
    stim[35] = 33'h141c287e1;
    stim[36] = 33'h1e19e572e;
    stim[37] = 33'h036483d30;
    stim[38] = 33'h0443bf1fe;
    stim[39] = 33'h0d2986319;
    stim[40] = 33'h124c36704;
    stim[41] = 33'h0a7f9f890;
    stim[42] = 33'h0ecbcc656;
    stim[43] = 33'h0d72000f3;
    stim[44] = 33'h041849571;
    stim[45] = 33'h10d9877ab;
    stim[46] = 33'h0a26ebee2;
    stim[47] = 33'h13e234333;
    stim[48] = 33'h1b42ad017;
    stim[49] = 33'h050bbf1a3;
    stim[50] = 33'h14e63a407;
    stim[51] = 33'h04d1c7e6d;
    stim[52] = 33'h19100b34a;
    stim[53] = 33'h0a957dbf7;
    stim[54] = 33'h08550b4f7;
    stim[55] = 33'h0c3c43173;
    stim[56] = 33'h1d4a04f71;
    stim[57] = 33'h1d00b63dc;
    stim[58] = 33'h106217645;
    stim[59] = 33'h1147a79f0;
    stim[60] = 33'h026784c67;
    stim[61] = 33'h095411d61;
    stim[62] = 33'h114e54362;
    stim[63] = 33'h055186b19;
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
      expv[0] = 66'h25c7ea9272e3f5493;
      expv[1] = 66'h01fcc23a40fe611d2;
      expv[2] = 66'h3f89036cbfc481b65;
      expv[3] = 66'h0e4abb4de7255da6f;
      expv[4] = 66'h32147a24390a3d121;
      expv[5] = 66'h3386378539c31bc29;
      expv[6] = 66'h060994dc2304ca6e1;
      expv[7] = 66'h0a3f6a97e51fb54bf;
      expv[8] = 66'h20cf00edf0678076f;
      expv[9] = 66'h0ae471dcc57238ee6;
      expv[10] = 66'h071d94cf638eca67b;
      expv[11] = 66'h38d0585afc682c2d7;
      expv[12] = 66'h122e5f7449172fba2;
      expv[13] = 66'h265d71a8532eb8d42;
      expv[14] = 66'h2c345416361a2a0b1;
      expv[15] = 66'h2bf7ab2955fbd594a;
      expv[16] = 66'h3346235eb9a311af5;
      expv[17] = 66'h3b267ab39d933d59c;
      expv[18] = 66'h24d2d90352696c81a;
      expv[19] = 66'h301e7e1b380f3f0d9;
      expv[20] = 66'h140b1de30a058ef18;
      expv[21] = 66'h2794d51b93ca6a8dc;
      expv[22] = 66'h066dbcb66336de5b3;
      expv[23] = 66'h1199b6c8e8ccdb647;
      expv[24] = 66'h22e1822e1170c1170;
      expv[25] = 66'h3f9b50525fcda8292;
      expv[26] = 66'h36cddd703b66eeb81;
      expv[27] = 66'h1a21e13c0d10f09e0;
      expv[28] = 66'h136c8e13c9b64709e;
      expv[29] = 66'h0ec07ca6e7603e537;
      expv[30] = 66'h387ee263bc3f7131d;
      expv[31] = 66'h15b05fe0aad82ff05;
      expv[32] = 66'h3f00bfc97f805fe4b;
      expv[33] = 66'h3c45e9d17e22f4e8b;
      expv[34] = 66'h06a97c69c354be34e;
      expv[35] = 66'h01c287e1c0e143f0e;
      expv[36] = 66'h219e572ef0cf2b977;
      expv[37] = 66'h36483d301b241e980;
      expv[38] = 66'h043bf1fe821df8ff4;
      expv[39] = 66'h12986319a94c318cd;
      expv[40] = 66'h24c367045261b3822;
      expv[41] = 66'h27f9f89033fcfc481;
      expv[42] = 66'h2cbcc656b65e632b5;
      expv[43] = 66'h172000f3ab900079d;
      expv[44] = 66'h0184957180c24ab8c;
      expv[45] = 66'h0d9877ab46cc3bd5a;
      expv[46] = 66'h226ebee231375f711;
      expv[47] = 66'h3e2343335f11a199a;
      expv[48] = 66'h342ad0177a15680bb;
      expv[49] = 66'h10bbf1a3885df8d1c;
      expv[50] = 66'h0e63a407c731d203e;
      expv[51] = 66'h0d1c7e6d868e3f36c;
      expv[52] = 66'h1100b34a688059a53;
      expv[53] = 66'h2957dbf734abedfb9;
      expv[54] = 66'h0550b4f722a85a7b9;
      expv[55] = 66'h03c43173a1e218b9d;
      expv[56] = 66'h14a04f71ea5027b8f;
      expv[57] = 66'h100b63dce805b1ee7;
      expv[58] = 66'h062176454310bb22a;
      expv[59] = 66'h147a79f04a3d3cf82;
      expv[60] = 66'h26784c67133c26338;
      expv[61] = 66'h15411d612aa08eb09;
      expv[62] = 66'h14e543624a72a1b12;
      expv[63] = 66'h15186b198a8c358cc;
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
