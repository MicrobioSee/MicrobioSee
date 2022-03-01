mol<-function(filedata,pdbidnm,inputmodel,dataformat,colorchoice,stylechoice,keepHchoice){
  if (inputmodel=="2"){
    data1<-read.table(filedata,sep = '\t')
    r3dmol(
      viewer_spec = m_viewer_spec(
        cartoonQuality = 10, # 图形质量
        lowerZoomLimit = 50, # 缩放下限
        upperZoomLimit = 350 # 缩放上限
      )
    ) %>%
      m_add_model(data = data1, format = as.character(dataformat),keepH = keepHchoice) %>%
      m_zoom_to() %>%m_set_style(sel = m_sel(ss = "h"),
                                 style = m_style_cartoon(
                                   color = colorchoice,style = as.character(stylechoice), thickness = 0.4))
  }else if(inputmodel=="1"){
    # pdbidnm='5D8V'
    r3dmol(
      viewer_spec = m_viewer_spec(
        cartoonQuality = 10, # 图形质量
        lowerZoomLimit = 50, # 缩放下限
        upperZoomLimit = 350 # 缩放上限
      )
    ) %>%
      m_add_model(m_fetch_pdb(pdbidnm), keepH = keepHchoice) %>%
      m_set_style(style =m_style_sphere()) %>%
      m_zoom_to() %>%
      m_set_style(style = m_style_cartoon(color = "#00cc96")) %>%
      # Set style of specific selection (selecting by secondary)
      m_set_style(
        sel = m_sel(ss = "s"),
        style = m_style_cartoon(color = "#636efa", arrows = TRUE)
      ) %>%
      # Style the alpha helix
      # m_set_style(
      #   sel = m_sel(ss = "h"), # Style alpha helix
      #   style = m_style_cartoon(color = "#ff7f0e")
      # ) %>%
      # Rotate the scene by given angle on given axis
      m_rotate(angle = 90, axis = "y") 
    
  }
  
}



# 
# r3dmol(
#   viewer_spec = m_viewer_spec(
#     cartoonQuality = 10,
#     lowerZoomLimit = 50,
#     upperZoomLimit = 350
#   ),
#   id = "demo",
#   elementId = "demo"
# ) %>%
#   # Add model to scene
#   m_add_model(data = pdb_6zsl, format = "pdb") %>%
#   # Zoom to encompass the whole scene
#   m_zoom_to() %>%
#   # Set style of structures
#   m_set_style(style = m_style_cartoon(color = "#00cc96")) %>%
#   # Set style of specific selection (selecting by secondary)
#   m_set_style(
#     sel = m_sel(ss = "s"),
#     style = m_style_cartoon(color = "#636efa", arrows = TRUE)
#   ) %>%
#   # Style the alpha helix
#   m_set_style(
#     sel = m_sel(ss = "h"), # Style alpha helix
#     style = m_style_cartoon(color = "#ff7f0e")
#   ) %>%
#   # Rotate the scene by given angle on given axis
#   m_rotate(angle = 90, axis = "y") 

