// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 114;
  localparam OW = 110;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_09954 dut (
    .clk(clk),
    .rst(in_vec[113:113]),
    .ex_exu_result(in_vec[112:81]),
    .ex_mem_store_data(in_vec[80:49]),
    .ex_mem_write(in_vec[48:48]),
    .ex_mem_read(in_vec[47:47]),
    .ex_mem_byte(in_vec[46:46]),
    .ex_mem_halfword(in_vec[45:45]),
    .ex_mem_sign_ext(in_vec[44:44]),
    .ex_mem_exu_mem_select(in_vec[43:43]),
    .ex_gpr_wa(in_vec[42:38]),
    .ex_gpr_we(in_vec[37:37]),
    .ex_kernel_mode(in_vec[36:36]),
    .ex_pc_current(in_vec[35:4]),
    .ex_mem_can_exc(in_vec[3:3]),
    .ex_flush(in_vec[2:2]),
    .ex_stall(in_vec[1:1]),
    .mem_stall(in_vec[0:0]),
    .mem_exu_result(out_vec[109:78]),
    .mem_mem_store_data(out_vec[77:46]),
    .mem_mem_write(out_vec[45:45]),
    .mem_mem_read(out_vec[44:44]),
    .mem_mem_byte(out_vec[43:43]),
    .mem_mem_halfword(out_vec[42:42]),
    .mem_mem_sign_ext(out_vec[41:41]),
    .mem_mem_exu_mem_select(out_vec[40:40]),
    .mem_gpr_wa(out_vec[39:35]),
    .mem_gpr_we(out_vec[34:34]),
    .mem_kernel_mode(out_vec[33:33]),
    .mem_pc_current(out_vec[32:1]),
    .mem_mem_can_exc(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 114'h3cdb97a532d6e75c3ad6c87db7713;
    stim[1] = 114'h326bf23e3bb54f59e5b26120c958f;
    stim[2] = 114'h08e320210c71bac3feb1dd893a137;
    stim[3] = 114'h11927c7d94211910e792e6a1958c3;
    stim[4] = 114'h1657bbdfa67c988ce376fcddc7621;
    stim[5] = 114'h1d0de88c40e332380261ea7f55ed6;
    stim[6] = 114'h0c1f5eccd160de54b52cd4c10368a;
    stim[7] = 114'h03d9e34f9a8e92b335b8f362ef96e;
    stim[8] = 114'h0659d716bc8d7155e8e07440adf4d;
    stim[9] = 114'h0c95564578cfb5423267b36674616;
    stim[10] = 114'h11fa4007db0f414a43391f7344d7b;
    stim[11] = 114'h07da32e9576cbc138963babfc8ac0;
    stim[12] = 114'h01022645c7392cc5605238e4fd401;
    stim[13] = 114'h0ba507126c2ff799d3597fe00b03d;
    stim[14] = 114'h14fbc2479f3eab9f011b799bdecec;
    stim[15] = 114'h18fbd2f3a0278b998d6a8a04f3a46;
    stim[16] = 114'h1238c9027f31a5fbbe5534adf8394;
    stim[17] = 114'h173e8f35dd121bfeddddaf3610175;
    stim[18] = 114'h1eb8771b20262bfb0dd4d07af4117;
    stim[19] = 114'h0db6a363899524804381140ec1bf9;
    stim[20] = 114'h052680d8be752acc4c0bb1e31bf4b;
    stim[21] = 114'h1f224027ce8d9fcd381f0573c8bc6;
    stim[22] = 114'h0aaa72e0ef001b5e25ec350868823;
    stim[23] = 114'h02b2f9980bcf0a61c12852685981e;
    stim[24] = 114'h0e72dd392ba9d9f44413f1fc9add4;
    stim[25] = 114'h0fc0cbf79088e28bb30e3bb68395d;
    stim[26] = 114'h05f02dfdef89dd37fdd9e5fa37764;
    stim[27] = 114'h10ff0ffe8c140c5255557c32ff93e;
    stim[28] = 114'h094231746150c43b3a6de08951782;
    stim[29] = 114'h1c77e03aa5498d991b60891da4f8d;
    stim[30] = 114'h156d6bf25fe2e3ea9b28873036ebb;
    stim[31] = 114'h27be4d14c67d35469a9fd3b541b98;
    stim[32] = 114'h0cb9b711d6ee8aa59c5feb7dfd81b;
    stim[33] = 114'h0c68fc28d2b5bfcf7f5f245509d84;
    stim[34] = 114'h0404b4a64424e6396318ba6363a2f;
    stim[35] = 114'h1a0dee4e631104a29f03dd46b8ae0;
    stim[36] = 114'h000984677bd194c4aa11f3f4a57f8;
    stim[37] = 114'h06d458034b56a910098e0f5846c67;
    stim[38] = 114'h006a4b0991bb7d86ebdfe1abb1ccd;
    stim[39] = 114'h023a3c22f39926539c3b08d60a0a2;
    stim[40] = 114'h075993dc38fc3f1c345a7ad2e4bfe;
    stim[41] = 114'h0971463b56271846efb88133c651f;
    stim[42] = 114'h2abbc2f026c9cc5ac5105572eede0;
    stim[43] = 114'h042f2cd21db47dd178d1a41d7b1df;
    stim[44] = 114'h1e06966a2f655124817e07d4c16d5;
    stim[45] = 114'h0be65a785fdeba9aad6888e7ff189;
    stim[46] = 114'h18bf4f76f360102b63636d6d26f5f;
    stim[47] = 114'h1bed14ea2c386496fc53f44aed9fc;
    stim[48] = 114'h1b37d81bcf5f4af6d8033249629fc;
    stim[49] = 114'h18312c6ec9752f0125b53b3a5d807;
    stim[50] = 114'h05b8996d9c062de6b706096374718;
    stim[51] = 114'h034da1d72cdad923f8280ac84db1f;
    stim[52] = 114'h11bd1cf34c165cc1a0eadd32f8c3d;
    stim[53] = 114'h12d5cdfaa9a963be28008adb68bf5;
    stim[54] = 114'h19c7f89ea247774bbe80907600aff;
    stim[55] = 114'h07e28c01731d17cd9778c5a9c9d07;
    stim[56] = 114'h1f29b9da793f35aa063a00697aaf8;
    stim[57] = 114'h16af9c608f4c55e3308789f59ea8c;
    stim[58] = 114'h39156a911f6b2afc23318088597d7;
    stim[59] = 114'h1937558bebc1e6b2e4158a796a021;
    stim[60] = 114'h003c8042f3f6eff76551a9a09a57a;
    stim[61] = 114'h02885c8a0e603e7951b4c62f4d1a6;
    stim[62] = 114'h0c29d0ab8f8d726cc8816dbf7e21e;
    stim[63] = 114'h13f820754c4a656fbebcb8eb234c2;
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
      expv[0] = 110'hxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[1] = 110'h0000000000000000000000000000;
      expv[2] = 110'h0000000000000000000000000000;
      expv[3] = 110'h0000000000000000000000000000;
      expv[4] = 110'h0000000000000000000000000000;
      expv[5] = 110'h0000000000000000000000000000;
      expv[6] = 110'h3a1bd11881c664700401d4feabda;
      expv[7] = 110'h183ebd99a2c1bca94a01a98206d0;
      expv[8] = 110'h07b3c69f351d25664b01e6c5df2c;
      expv[9] = 110'h07b3c69f351d25664b01e6c5df2c;
      expv[10] = 110'h192aac8af19f6a84440166cce8c2;
      expv[11] = 110'h192aac8af19f6a84440166cce8c2;
      expv[12] = 110'h0fb465d2aed9782712c7757f9158;
      expv[13] = 110'h0fb465d2aed9782712c7757f9158;
      expv[14] = 110'h0fb465d2aed9782712c7757f9158;
      expv[15] = 110'h29f7848f3e7d573e0200f337bd9c;
      expv[16] = 110'h31f7a5e7404f17330a011409e748;
      expv[17] = 110'h24719204fe634bf74c00695bf072;
      expv[18] = 110'h24719204fe634bf74c00695bf072;
      expv[19] = 110'h24719204fe634bf74c00695bf072;
      expv[20] = 110'h24719204fe634bf74c00695bf072;
      expv[21] = 110'h24719204fe634bf74c00695bf072;
      expv[22] = 110'h3e44804f9d1b3f9a40000ae79178;
      expv[23] = 110'h3e44804f9d1b3f9a40000ae79178;
      expv[24] = 110'h0565f330179e14c38200a4d0b302;
      expv[25] = 110'h1ce5ba725753b3e88801e3f935ba;
      expv[26] = 110'h1ce5ba725753b3e88801e3f935ba;
      expv[27] = 110'h0be05bfbdf13ba6fcb01cbf46eec;
      expv[28] = 110'h21fe1ffd182818a48a00f865ff26;
      expv[29] = 110'h128462e8c2a188764401c112a2f0;
      expv[30] = 110'h128462e8c2a188764401c112a2f0;
      expv[31] = 110'h128462e8c2a188764401c112a2f0;
      expv[32] = 110'h0000000000000000000000000000;
      expv[33] = 110'h0000000000000000000000000000;
      expv[34] = 110'h18d1f851a56b7f9ece0048aa13b0;
      expv[35] = 110'h18d1f851a56b7f9ece0048aa13b0;
      expv[36] = 110'h341bdc9cc62209453e07ba8d715c;
      expv[37] = 110'h001308cef7a329895423e7e94aff;
      expv[38] = 110'h001308cef7a329895423e7e94aff;
      expv[39] = 110'h001308cef7a329895423e7e94aff;
      expv[40] = 110'h04747845e7324ca7080011ac1414;
      expv[41] = 110'h0eb327b871f87e384800f5a5c97e;
      expv[42] = 110'h0eb327b871f87e384800f5a5c97e;
      expv[43] = 110'h0000000000000000000000000000;
      expv[44] = 110'h0000000000000000000000000000;
      expv[45] = 110'h0000000000000000000000000000;
      expv[46] = 110'h0000000000000000000000000000;
      expv[47] = 110'h0000000000000000000000000000;
      expv[48] = 110'h37da29d45870c92dc801e895db3e;
      expv[49] = 110'h366fb0379ebe95ed80006492c53e;
      expv[50] = 110'h366fb0379ebe95ed80006492c53e;
      expv[51] = 110'h0b7132db380c5bcd6e0c12c6e8e3;
      expv[52] = 110'h0b7132db380c5bcd6e0c12c6e8e3;
      expv[53] = 110'h0b7132db380c5bcd6e0c12c6e8e3;
      expv[54] = 110'h0b7132db380c5bcd6e0c12c6e8e3;
      expv[55] = 110'h0b7132db380c5bcd6e0c12c6e8e3;
      expv[56] = 110'h0b7132db380c5bcd6e0c12c6e8e3;
      expv[57] = 110'h3e5373b4f27e6b540c7400d2f55f;
      expv[58] = 110'h2d5f38c11e98abc6410113eb3d50;
      expv[59] = 110'h0000000000000000000000000000;
      expv[60] = 110'h0000000000000000000000000000;
      expv[61] = 110'h00790085e7eddfeeca01534134ae;
      expv[62] = 110'h0510b9141cc07cf283018c5e9a34;
      expv[63] = 110'h1853a1571f1ae4d98100db7efc42;
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
