// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 53;
  localparam OW = 40;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_09156 dut (
    .wb_clk_i(clk),
    .wb_rst_i(in_vec[52:52]),
    .wb_dat_i(in_vec[51:36]),
    .wb_adr_i(in_vec[35:20]),
    .wb_we_i(in_vec[19:19]),
    .wb_tga_i(in_vec[18:18]),
    .wb_stb_i(in_vec[17:17]),
    .wb_cyc_i(in_vec[16:16]),
    .flash_data_(in_vec[15:0]),
    .wb_dat_o(out_vec[39:24]),
    .wb_ack_o(out_vec[23:23]),
    .flash_addr_(out_vec[22:2]),
    .flash_we_n_(out_vec[1:1]),
    .flash_ce2_(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 53'h182b6e4edd60db;
    stim[1] = 53'h11b91d76a2ad32;
    stim[2] = 53'h031fd95619bb34;
    stim[3] = 53'h032bf73a09ef49;
    stim[4] = 53'h0b923e66c1b280;
    stim[5] = 53'h01f0bafcf25a1b;
    stim[6] = 53'h0db443bd7218ac;
    stim[7] = 53'h0e4dd6bfcadeeb;
    stim[8] = 53'h0174a3be4753bc;
    stim[9] = 53'h080a555f12c875;
    stim[10] = 53'h0df30ea1678d0e;
    stim[11] = 53'h05cab0530ab352;
    stim[12] = 53'h022b8bd17a8adf;
    stim[13] = 53'h096f5f76b5681b;
    stim[14] = 53'h07f3544ea88642;
    stim[15] = 53'h027f3a776ace5e;
    stim[16] = 53'h0b3227d4e9b46a;
    stim[17] = 53'h03b3b146846b87;
    stim[18] = 53'h0a4437a0e5e2ca;
    stim[19] = 53'h0e072a3d37ae81;
    stim[20] = 53'h080e61f88709e2;
    stim[21] = 53'h0d520328914984;
    stim[22] = 53'h0fc41130d99169;
    stim[23] = 53'h0d9fd551cc22bc;
    stim[24] = 53'h0a7f1cea609194;
    stim[25] = 53'h084e25171a701d;
    stim[26] = 53'h029fc8074cf031;
    stim[27] = 53'h09294d76f93860;
    stim[28] = 53'h0458d0cf4b35da;
    stim[29] = 53'h071034a1f8f4a8;
    stim[30] = 53'h03218b26a1e62b;
    stim[31] = 53'h0459a471a62b44;
    stim[32] = 53'h0b3015ec6890bd;
    stim[33] = 53'h0259553c09dcd9;
    stim[34] = 53'h02eec42de424ed;
    stim[35] = 53'h06aea42988f7d6;
    stim[36] = 53'h0271bf6c03bd44;
    stim[37] = 53'h0323a92a2110a1;
    stim[38] = 53'h0145885c0bbb22;
    stim[39] = 53'h0df4f30ee297b7;
    stim[40] = 53'h0a53bf5a6428af;
    stim[41] = 53'h0d11b4a89c11b6;
    stim[42] = 53'h084061a6e658da;
    stim[43] = 53'h02a1a5d0441de7;
    stim[44] = 53'h0cf1eb89b593b1;
    stim[45] = 53'h007adc7d1a9d2d;
    stim[46] = 53'h0ff0a0f0611cd0;
    stim[47] = 53'h1e0e610acf49be;
    stim[48] = 53'h09dc23926147de;
    stim[49] = 53'h037872d2446dcf;
    stim[50] = 53'h0bb32d291a273a;
    stim[51] = 53'h07fd7f0abf0e97;
    stim[52] = 53'h0a28c20edfbaa5;
    stim[53] = 53'h034583f806d38f;
    stim[54] = 53'h0361ba257cb3e8;
    stim[55] = 53'h0e395efcf728d2;
    stim[56] = 53'h064e778353b75a;
    stim[57] = 53'h0684fdc6032f42;
    stim[58] = 53'h0699a71795bc89;
    stim[59] = 53'h05d7fe0e941248;
    stim[60] = 53'h080b519883563a;
    stim[61] = 53'h059efde48eaa99;
    stim[62] = 53'h0bc0a8c0dc981f;
    stim[63] = 53'h093f7767b6cb9a;
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
      expv[0] = 40'h60dbxxxxxx;
      expv[1] = 40'had32xxxxb6;
      expv[2] = 40'hbb34035daa;
      expv[3] = 40'hef49025586;
      expv[4] = 40'hb28001ce82;
      expv[5] = 40'h5a1b0399b2;
      expv[6] = 40'h18ac02bf3e;
      expv[7] = 40'hdeeb00ef5e;
      expv[8] = 40'h53bc01aff2;
      expv[9] = 40'hc875c00393;
      expv[10] = 40'h8d0e0157c6;
      expv[11] = 40'hb352c0005b;
      expv[12] = 40'h8adf0014c2;
      expv[13] = 40'h681b02f45e;
      expv[14] = 40'h86424001ae;
      expv[15] = 40'hce5e0113aa;
      expv[16] = 40'hb46a029dda;
      expv[17] = 40'h6b8701f53a;
      expv[18] = 40'he2ca4001a2;
      expv[19] = 40'hae8140003a;
      expv[20] = 40'h09e2c0034f;
      expv[21] = 40'h4984c00223;
      expv[22] = 40'h916900ca26;
      expv[23] = 40'h22bc004c36;
      expv[24] = 40'h9194400072;
      expv[25] = 40'h701d033a9a;
      expv[26] = 40'hf0310145c6;
      expv[27] = 40'h38604001d2;
      expv[28] = 40'h35da035dbe;
      expv[29] = 40'hf4a88033d3;
      expv[30] = 40'he62b01287e;
      expv[31] = 40'h2b4402c9aa;
      expv[32] = 40'h90bd40006a;
      expv[33] = 40'hdcd9017b1a;
      expv[34] = 40'h24ed014f02;
      expv[35] = 40'hf7d640037a;
      expv[36] = 40'hbd44010a62;
      expv[37] = 40'h10a183db03;
      expv[38] = 40'hbb22024a8a;
      expv[39] = 40'h97b7821703;
      expv[40] = 40'h28af00c3ba;
      expv[41] = 40'h11b640029a;
      expv[42] = 40'h58da400226;
      expv[43] = 40'h1de74001ba;
      expv[44] = 40'h93b1400012;
      expv[45] = 40'h9d2d40026e;
      expv[46] = 40'h1cd0031f46;
      expv[47] = 40'h49be003c1a;
      expv[48] = 40'h47dec002b3;
      expv[49] = 40'h6dcf00e49a;
      expv[50] = 40'h273a400092;
      expv[51] = 40'h0e97034a46;
      expv[52] = 40'hbaa5c002af;
      expv[53] = 40'hd38fff5fb7;
      expv[54] = 40'hb3e84a3202;
      expv[55] = 40'h28d24a315e;
      expv[56] = 40'hb75aca333f;
      expv[57] = 40'h2f4281e0d7;
      expv[58] = 40'hbc89837183;
      expv[59] = 40'h12484a31e6;
      expv[60] = 40'h563a4a33a6;
      expv[61] = 40'haa99806623;
      expv[62] = 40'h981f4a3122;
      expv[63] = 40'hcb9a4a3036;
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
